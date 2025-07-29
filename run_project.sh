#!/bin/bash

# Load user environment settings
source ./user_profile.sh

# Print start message
echo "Running project workflow..."

# Step 1: Data loading
echo "Running data loading script..."
Rscript ./scripts/01_load_data.R

# Step 2: Data cleaning and merge
echo "Running data cleaning script..."
Rscript ./scripts/02_clean_merge_data.R

# Step 3: Data analysis
echo "Running data analysis script..."
Rscript ./scripts/03_analysis_data.R

# Step 4: Data visualization
echo "Running data visualization script..."
Rscript ./scripts/04_visualize_data.R

# Step 5: Generate report
echo "Rendering final report..."
Rscript -e "rmarkdown::render('./scripts/05_Rmarkdown_file.Rmd', output_format = 'html_document', output_dir = './output')"

# Done
echo "Project run complete. Output saved in ./output"
