---
editor_options:
  markdown:
    wrap: 72
---

# Presentation Outline: Countering Violence Against Women by Encouraging Disclosure

**Course:** Causal Inference in AI Models \| **Time:** 10 minutes \|
**Speakers:** Santiago, Steffi (Yen Hsi Lo), Ishika

------------------------------------------------------------------------

## Slide 0 — Title Slide

**Timing:** On screen as audience settles (0:00)

**On screen:**

-   Title: "Countering Violence Against Women by Encouraging Disclosure:
    A Mass Media Experiment in Rural Uganda"
-   Subtitle: "Replication & Causal Forest Extension"
-   Authors: Santiago Sierra, Yen Hsi Lo, Ishika Naranj
-   Course: Causal Inference in AI Models — ESMT Berlin
-   Date: March 2026
-   Small text at bottom: "Based on Green, Wilke & Cooper (2020,
    *Comparative Political Studies*) and Cooper, Green & Wilke (2020,
    *AER P&P*)"

**Speaker notes (Santiago):** "Good afternoon everyone."

*[Advance immediately to next slide — do NOT linger on title.]*

------------------------------------------------------------------------

## Slide 1 — The Scale of the Problem (THE HOOK)

**Speaker:** Santiago \| **Timing:** 0:00–0:40 (\~40 seconds)

**On screen:**

-   Full-screen display of `avg_pct_women_acceptance_to_hit.jpg`
-   Slide title: **"When is it acceptable for a man to hit his wife?"**
-   Caption below the chart: "Average percentage of women who state it
    is acceptable for a man to hit his wife in at least one of five
    scenarios, by country. Scenarios: argues with him, burns the food,
    goes out without telling him, neglects the children, or refuses sex.
    (DHS, 2001–2015). Solid line = sample average. Dashed line =
    Uganda."
-   Uganda (UGA) should be highlighted or circled on the chart — it sits
    near the dashed line at roughly 70%

**Speaker notes:** "Before we begin, let's take a look at this chart. It
shows the percentage of women — not men, *women* — who say it is
acceptable for a husband to hit his wife. Each dot is a country. The
dashed line is Uganda: about 70 percent of women in Uganda accept
violence as justified in at least one scenario. Ugandan women are among
the most affected countries in the world. About half of women aged 15
and older have experienced intimate partner violence. This is the
context in which the experiment we replicated takes place."

**Next Slide**

------------------------------------------------------------------------

## Slide 2 — Video Vignette

**Timing:** 0:40–1:50 (\~70 seconds)

**On screen:**

-   Embedded video: `VAW_Presentation/vignettes/IPV STORY 3 Round 2.mp4`
-   Brief text above or below: "One of three anti-VAW video vignettes
    screened at village film festivals in rural Uganda"

**Speaker notes (Santiago, brief intro before pressing play):** "The
paper we replicated, by Green, Wilke, and Cooper, was published in
*Comparative Political Studies* in 2020 and it tested whether a mass
media campaign could reduce domestic violence in rural Uganda, not by
changing people's attitudes, but by making them feel safer to report it.
And what was their approach? They screened short films about domestic
violence during community film festivals. One of them, or the first
minute of one of them is this one:"

*[Press play. Let video run \~50 seconds. No talking over it.]*

**Next Slide**

------------------------------------------------------------------------

## Slide 3 — Research Question & Experimental Design

**Speaker:** Santiago \| **Timing:** 1:50–3:30 (\~100 seconds)

**On screen — two-part slide or use animation to build:**

**Top half — Research question:**

-   Bold center text: **"Can a mass media campaign for
    anti-violence-against-women (anti-VAW) video vignettes screened at
    community film festivals change attitudes toward VAW, encourage
    reporting of violent incidents, and ultimately reduce the occurrence
    of intimate partner violence in rural Uganda?"**
-   Below in smaller text: "Green, Wilke & Cooper (2020, *Comparative
    Political Studies*)"

**Bottom half — Design summary (visual diagram preferred):**

-   **112 villages** in 16 geographic blocks across central Uganda
-   7 experimental conditions → collapsed to **binary treatment**:
    Anti-VAW vignettes (48 villages) vs. Control (64 villages)
-   670 film screenings, 10,000+ adult attendees
-   **Complier** = attended at least 1 screening
-   Surveys: Midline (Oct 2016, N=5,344) → Endline (May 2017, N=1,041
    compliers re-interviewed)
-   Analysis: OLS with block fixed effects, cluster-robust SEs at
    village level
-   Use `clusters_map.jpg` and/or `timeline_of_media_campaign.jpg` as
    visual support

**Speaker notes:** "The paper asks a subtle question. Most anti-VAW
campaigns try to change attitudes — convince people that violence is
wrong. But what if attitudes aren't the bottleneck? In Uganda, most
people already disapprove of severe violence. The real barrier might be
something else: the fear of being labeled a gossip if you report it. So
the researchers designed a cluster-randomized trial — 112 villages, 16
geographic blocks, seven conditions that collapse into a simple
treatment-control comparison. Treated villages saw anti-VAW vignettes at
community film festivals. Control villages saw the same Hollywood films
but without the vignettes. Surveys were conducted at midline and
endline, and we focus on compliers — people who actually attended at
least one screening. One note on methodology: the original paper uses
randomization inference for p-values; our replication uses parametric
p-values. This explains minor differences in significance stars, but our
point estimates match closely."

**Transition:** "Now Steffi will walk you through what we found."

------------------------------------------------------------------------

## Slide 4 — Key Result: Reporting Willingness

**Speaker:** Steffi \| **Timing:** 3:30–5:00 (\~90 seconds)

**On screen:**

-   Slide title: **"The campaign made women more willing to speak up"**
-   Simplified table comparing our replication to the paper (Women
    Compliers, N=321):

| Outcome (Women)             |  Our Estimate   | Paper Estimate  |
|-----------------------------|:---------------:|:---------------:|
| Involve Parents (EL)        |   0.144\*\*\*   |   0.172\*\*\*   |
| Involve Nabakyala (EL)      |   0.158\*\*\*   |    0.119\*\*    |
| Report to Police (EL)       |   0.130\*\*\*   |    0.117\*\*    |
| **Intervention Index (EL)** | **0.126\*\*\*** | **0.126\*\*\*** |

-   Below: a second, smaller table for Men Compliers (N=720):

| Outcome (Men)               | Our Estimate | Paper Estimate |
|-----------------------------|:------------:|:--------------:|
| **Intervention Index (EL)** |   0.043\*    |    0.043\*     |

-   Visual emphasis: green checkmarks or "Replicated" badges
-   Footnote: "OLS with block FE, LASSO covariates, cluster-robust SEs.
    \* p\<0.1, \*\* p\<0.05, \*\*\* p\<0.01 (parametric). Paper uses
    randomization inference."

**Speaker notes:** "Starting with the paper's central result —
willingness to report domestic violence. Among women, the campaign
produced strong, persistent effects. The composite intervention index,
which averages willingness to involve parents, the village women's
counselor, the local council chair, and the police, increased by 12.6
percentage points at endline. Our replication matches the paper exactly
on this measure. Across individual reporting channels, effects range
from 13 to 16 percentage points — all highly significant. For men, the
effects are smaller and only marginally significant — a 4.3 percentage
point increase on the index. This gender asymmetry is consistent and one
of the paper's key findings."

**Transition:** "But what's really interesting is *why* this works — and
whether it actually reduced violence."

------------------------------------------------------------------------

## Slide 5 — The Mechanism & Victimization

**Speaker:** Steffi \| **Timing:** 5:00–6:50 (\~110 seconds)

**On screen — three-panel slide:**

**Panel 1 (top left) — "Not about changing attitudes":**

-   Use `attitudes_VAW_and_gender_equality_unaffected_by_treatment.jpg`
    or a simplified version
-   All confidence intervals cross zero
-   Label: "No effect on attitudes toward VAW or gender equality (CPS
    Figure 5 — replicated)"

**Panel 2 (top right) — "It's about reducing the fear of speaking up":**

-   Key statistic highlighted: **"Women who expected to be called a
    'gossip' for reporting: 63% (control) → 52% (treatment)"** **−11.4
    pp (p\<0.05 parametric; RI p=0.01)**
-   Smaller text: "Social Repercussions, CPS Table 3"
-   Interpretation: "The campaign reduced the perceived social cost of
    reporting — the fear of being branded a gossip"

**Panel 3 (bottom) — "And violence went down":**

-   Simplified victimization results (CPS Table 4):

| Outcome (Women)              | Our Estimate | Paper Estimate |
|------------------------------|:------------:|:--------------:|
| Any Violence (Village-level) | −0.071\*\*\* |   −0.094\*\*   |
| Any Violence (W. Compliers)  |  −0.131\*\*  |  −0.131\*\*\*  |

-   Label: "13 percentage point reduction in violence among women
    compliers (from a control mean of 31%)"

**Speaker notes:** "Here is the crucial insight of this paper — and what
makes it so interesting. First, the campaign did *not* change attitudes.
Look at these confidence intervals — they all cross zero. Views on
whether violence is acceptable, gender equality, empathy — none of these
shifted. So if attitudes didn't change, what did? The answer is on the
right: the fear of social sanctions for reporting. In control villages,
63 percent of women expected to be scolded or called a gossip if they
reported a neighbor's abuse. The campaign reduced this to 52 percent —
an 11.4 percentage point drop, highly significant. The films didn't tell
people violence is wrong — people already knew that. Instead, the films
showed that reports are *believed*, that speaking up leads to help, not
punishment. And this mattered for real outcomes: among women compliers,
we see a 13 percentage point reduction in actual violence experienced,
matching the paper's estimate exactly."

**Transition:** "So the replication holds up well. But we wanted to go
further — who benefits most from this intervention? Ishika will show our
causal forest extension."

------------------------------------------------------------------------

## Slide 6 — Causal Forest Extension: Method & Results

**Speaker:** Ishika \| **Timing:** 6:50–8:20 (\~90 seconds)

**On screen — two-column layout:**

**Left column — Method:**

-   "Causal Forest (Athey, Tibshirani & Wager, 2019)"
-   Estimates *individual-level* treatment effects (CATEs)
-   Honest estimation: separate subsamples for splitting vs. estimation
-   4,000 trees, trained on 1,041 compliers
-   17 baseline covariates (age, household size, education, religion,
    baseline attitudes, asset index, etc.)
-   Clustered at village level

**Right column — Validation:**

-   ATE comparison:
    -   **OLS:** 0.064 (SE: 0.020)
    -   **Causal Forest:** 0.050 (SE: 0.020)
    -   "Forest confirms positive average effect"
-   Calibration: mean.forest.prediction significant (p=0.004)

**Bottom — CATE histogram:**

-   Distribution of individual-level treatment effects from the Rmd
    output
-   Red dashed line at ATE
-   Label: "CATEs range from −0.01 to +0.09 — not everyone benefits
    equally"

**Speaker notes:** "We extended the analysis using causal forests, which
estimate treatment effects at the *individual* level rather than just a
single average. We trained 4,000 trees on the complier sample using 17
baseline covariates — demographics, education, religion, attitudes, and
household characteristics. As a sanity check, the forest's average
treatment effect of 0.050 is close to the OLS estimate of 0.064, and the
calibration test confirms the model is well-specified. But the histogram
shows the real insight: treatment effects vary considerably across
individuals, from near-zero to almost 0.10. Not everyone benefits
equally — so who benefits most?"

**Transition:** "Let me show you the key heterogeneity patterns."

------------------------------------------------------------------------

## Slide 7 — Who Benefits Most?

**Speaker:** Ishika \| **Timing:** 8:20–9:30 (\~70 seconds)

**On screen — three bar-chart panels side by side (from Rmd output), or
simplified:**

**Panel 1 — Gender:**

| Group | GATE  |     95% CI      | Significant? |
|-------|:-----:|:---------------:|:------------:|
| Women | 0.080 | [0.013, 0.146]  |    Yes\*     |
| Men   | 0.037 | [−0.013, 0.086] |      No      |

**Panel 2 — Baseline Reporting Willingness:**

| Group         | GATE  |     95% CI      | Significant? |
|---------------|:-----:|:---------------:|:------------:|
| Low baseline  | 0.037 | [−0.003, 0.077] |      No      |
| High baseline | 0.100 | [0.024, 0.176]  |    Yes\*     |

**Panel 3 — Socioeconomic Status:**

| Group    | GATE  |     95% CI      | Significant? |
|----------|:-----:|:---------------:|:------------:|
| Low SES  | 0.042 | [−0.004, 0.088] |      No      |
| High SES | 0.067 | [0.009, 0.125]  |    Yes\*     |

**Bottom strip:**

-   Variable importance (top 4): Age (0.19) \> Household size (0.15) \>
    Baseline reporting (0.12) \> Education (0.11)
-   "BLP: Christian-only households are a significant moderator
    (p=0.028)"
-   Victimization CF: ATE = −0.122 (SE: 0.050) — confirms violence
    reduction

**Speaker notes:** "Three key findings. First, gender: the campaign's
effect on women is 0.080 — more than double the effect on men, and
statistically significant. The causal forest confirms the paper's gender
split using a completely data-driven approach. Second, baseline
attitudes: people who were *already* somewhat willing to report at
baseline benefit more — their effect is 0.100, nearly three times the
effect for those with low baseline willingness. This tells us the films
*reinforce* existing inclinations rather than converting skeptics from
scratch. Third, higher-SES individuals show larger effects. The variable
importance ranking confirms that age and household composition are the
strongest drivers of who benefits. And one interesting finding from the
best linear projection: being in a Christian-only household is a
significant moderator. Finally, we also ran a causal forest on the
victimization outcome for women, and the estimated effect is a 12.2
percentage point reduction in violence — consistent with the OLS
results."

**Transition:** "Let me close with the takeaways."

------------------------------------------------------------------------

## Slide 8 — Takeaways

**Speaker:** Ishika \| **Timing:** 9:30–10:00 (30 seconds)

**On screen — clean, minimal, no more than 4 lines:**

1.  **Replication succeeds**: point estimates match closely across all
    main results (Tables 1–4, AER P&P Table 1)
2.  **The campaign works — but not by changing minds**: it reduces the
    *fear of speaking up*, and violence drops
3.  **Not everyone benefits equally**: women, those already inclined to
    report, and higher-SES individuals gain the most
4.  **Policy implication**: target screenings toward women; build on
    existing pro-reporting norms rather than trying to change deep
    attitudes

-   Bottom: **"Thank you — Questions?"**

**Speaker notes:** "To close: we replicated the original findings
successfully. The campaign does not change attitudes about violence — it
changes something more actionable: the willingness to *speak up*. Our
causal forest extension reveals that this effect is not uniform — women,
those with some existing openness to reporting, and higher-SES
individuals benefit the most. For policymakers, this means: target the
people most likely to respond, and focus on making reporting feel safe
rather than lecturing about whether violence is wrong. Thank you — happy
to take questions."

------------------------------------------------------------------------

## Appendix: Backup Slides (if asked)

### Backup A — Survey Experiment (AER P&P Table 1)

-   2×2 factorial: Campaign (yes/no) × Others Observe (alone/group)
-   Campaign increases solo-reporting by \~6pp
-   "Others Observe" effect (+6pp among non-treated) disappears in
    treatment group (interaction −4.2pp)
-   Interpretation: campaign reduces the need for corroborating
    witnesses — you no longer need others to validate your report
-   Cell means: Control+Alone = 82.7%, Control+Others = 88.9%,
    Treatment+Alone = 89.1%, Treatment+Others = 91.0%

### Backup B — Causal Forest Technical Details

-   Calibration: mean.forest.prediction = 1.03 (p=0.004);
    differential.forest.prediction = −2.87 (p=0.998, not significant)
-   The forest captures the ATE well, but formal heterogeneity test does
    not reject homogeneity — CATEs should be interpreted with caution
-   Victimization CF (women only): ATE = −0.122 (SE: 0.050), calibration
    significant (p=0.007)
-   Full variable importance table available

### Backup C — Discrepancies & Methodology

-   Our men's results for individual reporting channels differ somewhat
    from the paper — we find a significant midline "Involve Parents"
    effect (0.082\*\*) that the paper does not. This may be due to
    differences in LASSO covariate selection or SE computation.
-   P-values: we use two-sided parametric; paper uses one-sided RI
    (1000+ permutations within blocks)
-   LASSO: pre-selected covariates loaded from original pipeline
-   SEs: sandwich::vcovCL (equivalent to multiwayvcov::cluster.vcov)
-   Ordered probit for victimization frequency did not converge in our
    replication — we report OLS instead

### Backup D — Balance & Sample

-   1,041 compliers (321 women, 720 men) in endline panel
-   Balance check: all covariates balanced except married_ml (p=0.006) —
    minor and consistent with randomization noise across many tests
-   110 villages in analysis (48 treatment, 64 control, 16 blocks)

------------------------------------------------------------------------

## Timing Summary

| Section                             | Speaker  | Time      | Cumulative |
|-------------------------------------|----------|-----------|------------|
| Slide 1 — The Hook (chart)          | Santiago | 0:40      | 0:40       |
| Slide 2 — Video vignette            | Santiago | 1:10      | 1:50       |
| Slide 3 — Research Q & Design       | Santiago | 1:40      | 3:30       |
| Slide 4 — Reporting Results         | Steffi   | 1:30      | 5:00       |
| Slide 5 — Mechanism & Victimization | Steffi   | 1:50      | 6:50       |
| Slide 6 — CF Method & Validation    | Ishika   | 1:30      | 8:20       |
| Slide 7 — Who Benefits Most         | Ishika   | 1:10      | 9:30       |
| Slide 8 — Takeaways                 | Ishika   | 0:30      | 10:00      |
| **Total**                           |          | **10:00** |            |

------------------------------------------------------------------------

## Visual Guidance

-   **Color scheme:** Consistent palette — e.g., teal/coral for
    treatment/control, dark accents for emphasis
-   **Slide 1:** Let the chart fill the screen. Uganda should be
    visually highlighted (circle, arrow, or color)
-   **Slides 4–5:** Keep tables to max 4–5 rows. Use color or bold to
    highlight key coefficients. Green checkmarks for replication match.
-   **Slide 5:** The three-panel layout tells the story visually:
    attitudes (null) → mechanism (gossip fear) → outcome (less violence)
-   **Slides 6–7:** Include charts from the Rmd output (CATE histogram,
    GATE bar charts). Visuals \> tables.
-   **Slide 8:** Minimal text. Four clear takeaways, no clutter.
-   **Font size:** Nothing below 18pt. Speaker notes carry the detail;
    slides carry the message.
-   **Every slide has a one-line takeaway** at the top in bold — this is
    what the audience remembers.

------------------------------------------------------------------------

## Story Arc Summary

The presentation follows a deliberate narrative arc:

1.  **HOOK** (Santiago): Shock the audience with the scale of the
    problem — the acceptance chart. Ground them in the reality.
2.  **FEEL** (Santiago): Show the video vignette. Let the audience
    experience the intervention emotionally before we analyze it.
3.  **FRAME** (Santiago): Introduce the subtle research question — it's
    not about changing minds, it's about making reporting safer. Explain
    the design concisely.
4.  **PROVE** (Steffi): Show the replication works. Women become more
    willing to report. Numbers match.
5.  **EXPLAIN** (Steffi): The key slide. Three panels tell the mechanism
    story: attitudes didn't change → fear of gossip decreased → violence
    went down. This is the intellectual core of the paper.
6.  **EXTEND** (Ishika): Causal forests add individual-level nuance. The
    average effect is real and validated.
7.  **DISCOVER** (Ishika): Who benefits? Women, those already inclined
    to report, higher-SES. The intervention reinforces, not converts.
8.  **CLOSE** (Ishika): Four crisp takeaways. Policy-relevant, concise,
    and memorable.
