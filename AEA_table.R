# This script can be used to replicate the table in the AEA Papers and 
# Proceedings article

rm(list = ls())

# Load useful functions ---------------------------------------------------

source("02_code/00_useful_functions/variable_building_functions.R")

# Make codebooks ----------------------------------------------------------

# Codebooks are R list objects that correspond to each question in the 
# survey. For example, mlcb$sex_q2_1 gives the labels corresponding to 
# variable sex_q2_1 in the adult household survey

source("02_code/01_codebook/make_codebook.R")

# Load data and packages --------------------------------------------------

# - packages will be installed locally via packrat
# - load the different datasets used in the analysis

source("02_code/02_load_and_clean_data/00_load_packages_and_data.R")

# Building data for analysis ----------------------------------------------

rerun_data_building <- TRUE

if(rerun_data_building){
	
	# Clean data --------------------------------------------------------------
	
	# These scripts implement the cleaning of data conducted in the field by 
	# the field manager.  
	
	# Random sampling data 
	source("02_code/02_load_and_clean_data/01_clean_random_sampling_data.R")
	
	# Sampling Radius Data
	source("02_code/02_load_and_clean_data/01_clean_sampling_radius_data.R")
	
	# Intervention data 
	source("02_code/02_load_and_clean_data/01_clean_festival_data.R")
	
	# Household data
	source("02_code/02_load_and_clean_data/01_clean_household_data_midline.R")
	source("02_code/02_load_and_clean_data/01_clean_household_data_endline.R")
	
	# VHT data
	source("02_code/02_load_and_clean_data/01_clean_vht_data_midline.R")
	source("02_code/02_load_and_clean_data/01_clean_vht_data_endline.R")
	
	# Code Variables Midline---------------------------------------------------
	
	# These scripts create the outcomes and covariates used in the analysis
	# of the midline data.
	
	# Household Survey 
	source("02_code/03_variable_coding/01_code_outcomes_hh_midline.R")
	source("02_code/03_variable_coding/01_code_covariates_hh_midline.R")
	
	# VHT Survey
	source("02_code/03_variable_coding/01_code_variables_vht_midline.R")
	
	# Build lists of variable names
	source("02_code/03_variable_coding/02_build_variable_lists_midline.R")
	
	# Save non-imputed midline data
	ml_no_imp <- ml
	
	# Impute Variables Midline ------------------------------------------------
	
	# Here we use multiple chained imputation as pre-registered to impute 
	# item-level missingness in the midline.
	
	# Household Survey
	ml <- arrange(ml, KEY)
	source("02_code/03_variable_coding/03_impute_variables_hh_midline.R")
	
	# VHT Survey
	vht_ml <- arrange(vht_ml,KEY)
	source("02_code/03_variable_coding/03_impute_variables_vht_midline.R")
	
	# Merging -----------------------------------------------------------------
	
	# These scripts merge midline and endline surveys, and also bring in 
	# cluster-level covariates into the household data.
	
	# Merge midline and endline household surveys
	source("02_code/04_merging/01_merge_midline_endline.R")
	
	# Merge trading center level variables into other datasets
	source("02_code/04_merging/02_merge_in_trading_center_level_variables.R")
	
	# Code Variables Endline --------------------------------------------------
	
	# These scripts build variables used in the analysis of he endline data.
	
	# Household Survey
	source("02_code/03_variable_coding/01_code_outcomes_hh_endline.R")
	
	# These questions were randomized and so need to be re-merged
	source("02_code/03_variable_coding/01_code_outcomes_hh_endline_randomized.R")
	source("02_code/03_variable_coding/01_code_compliance_related_hh_endline.R")
	source("02_code/03_variable_coding/01_code_covariates_hh_endline.R")
	
	# VHT Survey
	source("02_code/03_variable_coding/01_code_covariates_vht_endline.R")
	source("02_code/03_variable_coding/01_code_outcomes_vht_endline.R")
	
	# Build lists of variable names for use in imputation and in analysis
	source("02_code/03_variable_coding/02_build_variable_lists_endline.R")
	
	# Save non-imputed endline data
	el_no_imp <- el
	
	# Impute Variables Endline ------------------------------------------------
	
	# Here we use multiple chained imputation as pre-registered to impute 
	# item-level missingness in the endline.
	
	# Household Survey
	el <- arrange(el,KEY)
	source('02_code/03_variable_coding/02_impute_variables_hh_endline.R')
	
	# VHT Survey
	vht_el <- arrange(vht_el,KEY)
	source("02_code/03_variable_coding/03_impute_variables_vht_endline.R")
	
	# Save data image ---------------------------------------------------------
	
	save.image(file = "01_data/UG_VAW_data.Rdata")
	
} else {
	
	load(file = "01_data/UG_VAW_data.Rdata")
	
}

# Build Indices -----------------------------------------------------------

# Building index variables from imputed components

source("02_code/03_variable_coding/04_build_indices.R")

# Select covariates -------------------------------------------------------

# Load custom-written lasso selection functions
source("02_code/00_useful_functions/lasso_functions.R")

# Analyses ----------------------------------------------------------------

# These are the estimator and RI functions used in all analyses
source('02_code/00_useful_functions/analysis_functions.R')
source("02_code/00_useful_functions/randomization_functions.R")


# Set sims ----------------------------------------------------------------
sims <- 3000

# Subset data to compliers ------------------------------------------------
df <- subset(el, respondent_category == "Complier")

# Function for clustered SEs ----------------------------------------------

get_SEs <- function(fit, dat){
	vcov_mat <- cluster.vcov(
		model = fit,
		cluster = as.factor(dat$tc_id)
	)
	fit_summary <- coeftest(x = fit,vcov. = vcov_mat)
	SEs <- fit_summary[,"Std. Error"]
	return(SEs)
}

# Function for RI on both treatments --------------------------------------

get_null <- function(sims, formula, dat){
	replications <- replicate(
		n = sims,
		expr ={ 
			new_data <- rerandomize(
				tc_level_data = treatment_assignment,
				analysis_data = dat
			)
			new_data$others_observe <- rbinom(n = nrow(new_data),size = 1,prob = .5)
			
			fit <- lm(
				formula = formula,
				data = new_data
			)
			coef(fit)
		}
	)
	return(replications)
}

# Upper-tailed P-values as pre-registered

# Run survey experiment models --------------------------------------------

set.seed(123456)

prime_formula <- as.formula(would_report ~ as.factor(block_id) + resample + n_end_mean + others_observe)
IPV_formula <- as.formula(would_report ~ as.factor(block_id) + resample + n_end_mean + IPV)
interacted_formula <- as.formula(would_report ~ as.factor(block_id) + resample + n_end_mean + others_observe * IPV)

prime_among_control <- lm(prime_formula, data = df, subset = IPV == 0)
prime_among_control_SEs <- get_SEs(prime_among_control, subset(df,IPV == 0))
prime_among_control_null <- get_null(sims = sims, 
																		 formula = prime_formula, 
																		 dat = subset(df, IPV == 0))
prime_among_control_Ps <- rowMeans(abs(coef(prime_among_control)) <= abs(prime_among_control_null))

IPV_among_control <- lm(IPV_formula, data = df, subset = others_observe == 0)
IPV_among_control_SEs <- get_SEs(IPV_among_control, subset(df,others_observe == 0))
IPV_among_control_null <- get_null(sims = sims, 
																	 formula = IPV_formula, 
																	 dat = subset(df, others_observe == 0))
IPV_among_control_Ps <- rowMeans(abs(coef(IPV_among_control)) <= abs(IPV_among_control_null))

prime_among_treatment <- lm(prime_formula, data = df, subset = IPV == 1)
prime_among_treatment_SEs <- get_SEs(prime_among_treatment, subset(df,IPV == 1))
prime_among_treatment_null <- get_null(sims = sims, 
																			 formula = prime_formula, 
																			 dat = subset(df, IPV == 1))
prime_among_treatment_Ps <- rowMeans(abs(coef(prime_among_treatment)) <= abs(prime_among_treatment_null))

IPV_among_treatment <- lm(IPV_formula, data = df, subset = others_observe == 1)
IPV_among_treatment_SEs <- get_SEs(IPV_among_treatment, subset(df,others_observe == 1))
IPV_among_treatment_null <- get_null(sims = sims, 
																		 formula = IPV_formula, 
																		 dat = subset(df, others_observe == 1))
IPV_among_treatment_Ps <- rowMeans(abs(coef(IPV_among_treatment)) <= abs(IPV_among_treatment_null))

prime_interaction <- lm(interacted_formula,df)
prime_interaction_SEs <- get_SEs(prime_interaction, df)
prime_interaction_null <- get_null(sims = sims, 
																	 formula = interacted_formula, 
																	 dat = df)
prime_interaction_Ps <- rowMeans(abs(coef(prime_interaction)) >= abs(prime_interaction_null))

# anti_intervention_consequence

anti_intervention_consequence_el <- ols_main(
	outcome = "anti_intervention_consequence",
	treatment = "IPV",
	resample_FE = TRUE,
	block_FE = TRUE,
	audience_size = TRUE,
	cluster_SE = TRUE,
	covariates = NULL,
	the_data = subset(el, respondent_category == "Complier"),
	dosage = FALSE,
	dosage_indicator = FALSE)

anti_intervention_consequence_el_pvals <- get_RI_pvals(
	outcome = "anti_intervention_consequence",
	treatment = "IPV",
	resample_FE = TRUE,
	block_FE = TRUE,
	audience_size = TRUE,
	cluster_SE = TRUE,
	covariates = NULL,
	the_data = subset(el, respondent_category == "Complier"),
	dosage = FALSE,
	dosage_indicator = FALSE,
	assignment_data = treatment_assignment,
	extract_function = coef,
	analysis_function = ols_main,
	sims = sims,
	Lwr_Upr_two = "Lwr")

# Predict interacted values
df$int_prediction <- predict(object = prime_interaction)
df$cost_prediction <- predict(object = anti_intervention_consequence_el$fit)

digits <- 3

# Row 1: mean of those who would intervene if alone, in control and treatment
row_1 <- 
	with(df,c(
		paste0("Mean = ", round(mean(int_prediction[others_observe == 0 & IPV == 0]),digits)*100,"%"),
		paste0("Mean = ", round(mean(int_prediction[others_observe == 0 & IPV == 1]),digits)*100,"%"),
		paste0("\\hat{\\beta} = +", 
					 round(mean(int_prediction[others_observe == 0 & IPV == 1]) - 
					 				mean(int_prediction[others_observe == 0 & IPV == 0]),(digits+1))*100,"pp"))
	)

row_1_SEs <- 
	c(NA, NA, paste0("(SE = ",
									 round(IPV_among_control_SEs["IPV"],digits)*100, 
									 ")"))
row_1_ps <- 
	c(NA, NA, paste0("($p$ = ",
									 round(IPV_among_control_Ps["IPV"],digits),
									 ")"
	))

# Row 2: mean of those who would intervene if others obs, in control and treatment
row_2 <- 
	with(df,c(
		paste0("Mean = ", round(mean(int_prediction[others_observe == 1 & IPV == 0]),digits)*100,"%"),
		paste0("Mean = ", round(mean(int_prediction[others_observe == 1 & IPV == 1]),digits)*100,"%"),
		paste0("\\hat{\\beta} = +", 
					 round(mean(int_prediction[others_observe == 1 & IPV == 1]) - 
					 				mean(int_prediction[others_observe == 1 & IPV == 0]),(digits+1))*100,"pp"))
	)

row_2_SEs <- 
	c(NA, NA, paste0("(SE = ",
									 round(IPV_among_treatment_SEs["IPV"],digits)*100, 
									 ")"))
row_2_ps <- 
	c(NA, NA, paste0("($p$ = ",
									 round(IPV_among_treatment_Ps["IPV"],digits),
									 ")"
	))

# Row 3: effect of prime in control and treatment
row_3 <- 
	with(df,c(
		paste0("\\hat{\\beta} = +", 
					 round(mean(int_prediction[others_observe == 1 & IPV == 0]) - mean(int_prediction[others_observe == 0 & IPV == 0]),(digits+1))*100,"pp"),
		paste0("\\hat{\\beta} = +", 
					 round(mean(int_prediction[others_observe == 1 & IPV == 1]) - mean(int_prediction[others_observe == 0 & IPV == 1]),(digits+1))*100,"pp"),
		paste0("\\hat{\\beta} = ", 
					 round((mean(int_prediction[others_observe == 1 & IPV == 1]) - mean(int_prediction[others_observe == 0 & IPV == 1])) - 
					 				(mean(int_prediction[others_observe == 1 & IPV == 0]) - mean(int_prediction[others_observe == 0 & IPV == 0])),(digits+1))*100,"pp") 
	))


row_3_SEs <- 
	c(
		paste0("(SE = ",
					 round(prime_among_control_SEs["others_observe"],digits)*100, 
					 ")"),
		paste0("(SE = ",
					 round(prime_among_treatment_SEs["others_observe"],digits)*100, 
					 ")"),
		paste0("(SE = ",
					 round(prime_interaction_SEs["others_observe:IPV"],digits)*100, 
					 ")")
	)
row_3_ps <- 
	c(
		paste0("($p$ = ",
					 round(prime_among_control_Ps["others_observe"],digits), 
					 ")"),
		paste0("($p$ = ",
					 round(prime_among_treatment_Ps["others_observe"],digits), 
					 ")"),
		paste0("($p$ = ",
					 round(prime_interaction_Ps["others_observe:IPV"],digits), 
					 ")")
	)


# Row 4: mean of repercussions in control and treatment
row_4 <- 
	with(df,c(
		paste0("Mean = ", round(mean(cost_prediction[IPV == 0]),digits)*100,"%"),
		paste0("Mean = ", round(mean(cost_prediction[IPV == 1]),digits)*100,"%"),
		paste0("\\hat{\\beta} = ", round(mean(cost_prediction[IPV == 1]) - mean(cost_prediction[IPV == 0]),4)*100,"pp")))

row_4_SEs <- 
	c(
		NA, NA,
		paste0("(SE = ",
					 round(anti_intervention_consequence_el$fit_summary["IPV","Std. Error"],digits)*100, 
					 ")")
	)
row_4_ps <- 
	c(
		NA, NA,
		paste0("($p$ = ",
					 round(anti_intervention_consequence_el_pvals$ri_pvals["IPV"],digits), 
					 ")")
	)


# Make table --------------------------------------------------------------


tab <- 
	rbind(row_1,row_1_SEs,row_1_ps,
				row_2,row_2_SEs,row_2_ps,
				row_3,row_3_SEs,row_3_ps,
				row_4,row_4_SEs,row_4_ps
	)


write.csv(x = tab,file = "03_tables/AEA_table.csv",row.names = FALSE)

Ns <- with(df, 
					 c(sum(others_observe == 0 & IPV == 0),
					 	sum(others_observe == 0 & IPV == 1),
					 	sum(others_observe == 1 & IPV == 0),
					 	sum(others_observe == 1 & IPV == 1)
					 ))








