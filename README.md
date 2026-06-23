# Statistical-Analysis-of-Systems

Beginner-to-medium level R environment for statistical analysis of systems.

## What is included

- `scripts/01_beginner_descriptive_statistics.R`  
  Introductory workflow using base R and tidyverse-style tools for:
  - data simulation
  - summary statistics
  - distributions and plotting
  - correlation analysis
- `scripts/02_medium_regression_and_anova.R`  
  Intermediate workflow for:
  - linear regression diagnostics
  - ANOVA with post-hoc testing
  - grouped summaries and visualization

## Requirements

- R (4.1+ recommended)
- CRAN packages used in scripts:
  - `dplyr`
  - `ggplot2`
  - `tidyr`

## How to run

From the repository root:

```bash
Rscript scripts/01_beginner_descriptive_statistics.R
Rscript scripts/02_medium_regression_and_anova.R
```

Each script includes package checks and will install missing required packages from CRAN automatically.
