#!/bin/bash

# Add Rscript to PATH temporarily for this session
export PATH=$PATH:/c/Windows/R-4.3.2/bin/x64

# Set a CRAN mirror
export R_DEFAULT_PACKAGES="utils,grDevices,graphics,stats,methods,base"
Rscript -e 'options(repos = c(CRAN = "https://cloud.r-project.org"))'

# Install necessary R packages
Rscript -e "
required_packages <- c('tidyverse', 'rmarkdown', 'countrycode');
new_packages <- required_packages[!(required_packages %in% installed.packages()[, 'Package'])];
if(length(new_packages)) install.packages(new_packages)"

# Define and export project paths
export PROJECT_DIR=$(pwd)
export DATA_DIR="$PROJECT_DIR/data"
export OUTPUT_DIR="$PROJECT_DIR/output"
export SCRIPT_DIR="$PROJECT_DIR/scripts"

echo "Environment variables set:"
echo "PROJECT_DIR=$PROJECT_DIR"
echo "DATA_DIR=$DATA_DIR"
echo "OUTPUT_DIR=$OUTPUT_DIR"
echo "SCRIPT_DIR=$SCRIPT_DIR"
echo "DOC_DIR=$DOC_DIR"
