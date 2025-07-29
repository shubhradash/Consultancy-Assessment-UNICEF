# Test for Consultancy with the D&A Education Team
install.packages("countrycode", repos = "https://cloud.r-project.org")
install.packages("readxl", repos = "https://cloud.r-project.org")
install.packages("openxlsx", repos = "https://cloud.r-project.org")

library(tidyverse)
library(readxl)
library(openxlsx)
library(janitor)
library(openxlsx)

# Load the long-format UNICEF data
unicef_data <- read_csv("data/fusion_GLOBAL_DATAFLOW_UNICEF_1.0_.MNCH_ANC4+MNCH_SAB.csv")

# Load mortality status data
mortality_status_raw <- read_excel("data/On-track and off-track countries.xlsx")

# Load WPP data
pop_data <- read_excel("data/WPP2022_GEN_F01_DEMOGRAPHIC_INDICATORS_COMPACT_REV1.xlsx", sheet = "Projections", skip = 16, col_types = "text") %>%
  clean_names() 

saveRDS(unicef_data, file = "data/unicef_data.rds")
