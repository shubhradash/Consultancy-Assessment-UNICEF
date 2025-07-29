# Test for Consultancy with the D&A Education Team

## Population-Weighted Health Service Coverage Analysis

This project analyzes coverage of key maternal health services (ANC4 and SBA) across 
countries, distinguishing between those "On Track" vs. "Off Track" toward health goals. 
It calculates population-weighted averages using UNICEF and UN data.

------------------------------------------------------------------------
### Repository Structure
├── Consultancy-Assessment-UNICEF
    ├── data/ # Raw and cleaned data files
    ├── documentation/ # Reports and supporting documentation
    ├── scripts/ # R scripts for data processing and analysis
    ├── output/ # Final figures, tables, and results
    ├── user_profile.R # Environment configuration script
    ├── run_project.R # Master script to run entire workflow
    ├── README.md # Project overview and instructions

------------------------------------------------------------------------
### Folder and File Descriptions

- **data/** 
  - fusion_GLOBAL_DATAFLOW_UNICEF_1.0_.MNCH_ANC4+MNCH_SAB.csv is anc4 and sba indicator
  data from UNICEF Global Data Repository for the years 2018–2022:
  - WPP2022_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT_REV1.xlsx has population and birth 
  data UN World Population Prospects, 2022
  - On-track and off-track countries.xlsx has data on Under-five mortality classification
  
- **scripts/**  
  Contains modular R scripts:
  - `01_load_data.R`: Imports Excel files
  - `02_clean_merge_data.R`: Cleans and merges datasets
  - `03_analysis_data.R`: Computes weighted averages
  - `04_visualize_data.R`: Generates plots

- **output/**  
  -coverage_plot.png has the plots of weighted coverage.
  -inference_document.pdf has the inferences of the graph as well as caveats and assumptions
  -final_report.html contains the final knitted report in HTML.

- **user_profile.R**  
  Ensures reproducibility: installs required packages and sets global options.

- **run_project.R**  
  Executes all scripts in order, from loading data to generating the report.

------------------------------------------------------------------------

### Reproducing the Analysis

1. **Clone the repository**:
   ```bash
   git clone https://github.com/your-username/your-repo.git
   cd your-repo
   
2. Open R or RStudio and run:

source("user_profile.R")
source("run_project.R")

3. Requirements

R 4.1 or higher
R packages: tidyverse, readxl, janitor, ggplot2

------------------------------------------------------------------------

### Positions Apllied 
-Learning and Skills Data Analyst Consultant – Req. #581598
-Household Survey Data Analyst Consultant – Req. #581656
-Administrative Data Analyst – Req. #581696
-Microdata Harmonization Consultant – Req. #581699

------------------------------------------------------------------------