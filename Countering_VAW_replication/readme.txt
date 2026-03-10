                                  Readme for: 
          "Countering Violence Against Women by Encouraging Disclosure: 
                   A mass media experiment in rural Uganda"
                 Donald P. Green, Anna M. Wilke, Jasper Cooper

                                   Contents

- 01_data/                              =    Contains raw data
  - boostrap_extrapolation.Rdata        =    Stored output extrapolation
  - cluster_level_data/                 =    Village-level data
    - film_festival.csv                 =    Data on intervention
    - location_data.csv                 =    Data that link cluster IDs to districts
    - sampling_radius.csv               =    Radii for sampling of Rs
    - treatment_assignment.csv          =    Random assignment
  - codebooks/                          =    ODK tablet coding
    - endline_choices.csv               =    Endline survey answer choices
    - endline_Qs.csv                    =    Endline survey questions
    - midline_choices.csv               =    Midline survey answer choices
    - midline_Qs.csv                    =    Midline survey questions
    - vht_endline_choices.csv           =    VHT endline survey answer choices
    - vht_endline_Qs.csv                =    Endline VHT survey questions
    - vht_midline_choices.csv           =    VHT midline survey answer choices
    - vht_midline_Qs.csv                =    Midline VHT survey questions
  - household/                          =    Household level data
    - distance_data.csv                 =    Distance of Rs to video hall
    - endline_1.csv                     =    Endline HH survey
    - endline_2.csv                     =    Endline HH survey
    - endline_3.csv                     =    Endline HH survey
    - endline_4.csv                     =    Endline HH survey
    - midline_1.csv                     =    Midline HH survey
    - midline_2.csv                     =    Midline HH survey
    - midline_3_1.csv                   =    Midline HH survey
    - midline_3_2.csv                   =    Midline HH survey
    - midline_3.csv                     =    Midline HH survey
    - midline_4.csv                     =    Midline HH survey
    - midline_5.csv                     =    Midline HH survey
    - random_sampling_1.csv             =    Random sampling of Rs in midline
    - random_sampling_2.csv             =    Random sampling of Rs in midline
  - lasso_selected_covariates.Rdata     =    Covariates selected through lasso
  - UG_VAW_data.Rdata                   =    Stored full data
  - vht/                                =    VHT datasets
    - vht_el_1.csv                      =    VHT endline survey
    - vht_ml_1.csv                      =    VHT midline survey
    - vht_ml_2.csv                      =    VHT midline survey
    - vht_ml_3.csv                      =    VHT midline survey
    - vht_ml_4.csv                      =    VHT midline survey
- 02_code/                              =    Code scripts
  - __main_script.R                     =    Main script that runs others
  - 00_useful_functions/                =    Functions used throughout
  - 01_codebook/                        =    Scripts that build codebooks
  - 02_load_and_clean_data/             =    Loading and cleaning datasets
  - 03_variable_coding/                 =    Coding outcomes and covariates
  - 04_merging/                         =    Merging datasets
  - 05_covariate_selection/             =    Lasso covariate selection
  - 06_analyses_paper/                  =    Analysis scripts
  - 07_analyses_appendix/               =    Robustness check scripts
- 03_tables/                            =    Tables are output here
- 04_figures/                           =    Figures are output here
- IPV_replication.Rproj                 =    Run everything from here


                            How to run the code 

1. Open IPV_replication.Rproj to ensure that all file paths are set relative to
   the replication archive
2. Open __main_script.R and run all scripts from here
3. True / false logics switch on and off scripts that take a long time to run

                      Explanations and clarifications

- Most analyses are based on a panel of "compliers" interviewed in both the 
  midline and endline surveys. This subset can be identified using the 
  subset respondent_category == "Complier". 
- We did not re-ask all questions of those in the panel, so their endline 
  responses are merged in from midline.
- The multiple versions of the raw data correspond to the different datasets
  output by ODK / CSO when a change is made to the survey. Each change requires
  a new survey version, thus producing a new dataset.
- The only change made to the raw data files is the removal of PII and variables 
  that are not used in the analysis. 
- All other modifications made to data (changing of values, etc.) in cleaning 
  scripts were implemented by field manager over course of field work. 

														   R Packages

Here is a list of all the packages and their versions (along with recursive
dependencies) that were used to produce these results. We have also archived
the source code for all of these, please reach out if you require the source
code for any of the below.

    BH           1.69.0-1 
    MASS         7.3-51.4 
    Matrix       1.2-17   
    R6           2.4.0    
    Rcpp         1.0.1    
    RcppEigen    0.3.3.5.0
    assertthat   0.2.1    
    backports    1.1.4    
    boot         1.3-22   
    broom        0.5.2    
    cli          1.1.0    
    clipr        0.6.0    
    crayon       1.3.4    
    digest       0.6.18   
    dplyr        0.8.3    
    ellipsis     0.2.0.1  
    evaluate     0.13     
    fansi        0.4.0    
    forcats      0.4.0    
    generics     0.0.2    
    glue         1.3.1    
    haven        2.2.0    
    highr        0.8      
    hms          0.5.2    
    jomo         2.6-7    
    knitr        1.22     
    lattice      0.20-38  
    lifecycle    0.1.0    
    lme4         1.1-21   
    lmtest       0.9-37   
    magrittr     1.5      
    markdown     0.9      
    mice         3.4.0    
    mime         0.6      
    minqa        1.2.4    
    mitml        0.3-7    
    nlme         3.1-139  
    nloptr       1.2.1    
    nnet         7.3-12   
    numDeriv     2016.8-1 
    ordinal      2019.4-25
    packrat      0.5.0    
    pan          1.6      
    pillar       1.4.3    
    pkgconfig    2.0.2    
    plogr        0.2.0    
    plyr         1.8.4    
    purrr        0.3.3    
    readr        1.3.1    
    reshape2     1.4.3    
    rlang        0.4.2    
    rpart        4.1-15   
    stringi      1.4.3    
    stringr      1.4.0    
    survival     2.44-1.1 
    tibble       2.1.3    
    tidyr        1.0.0    
    tidyselect   0.2.5    
    ucminf       1.1-4    
    utf8         1.1.4    
    vctrs        0.2.0    
    xfun         0.6      
    yaml         2.2.0    
    zeallot      0.1.0    
    zoo          1.8-6  
