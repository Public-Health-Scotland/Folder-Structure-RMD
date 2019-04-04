#########################################################################
# Name of file - Run.R
# Data release - Template
# Original Authors - Tina Fu, Rory Madigan, Ewout Jaspers
# Orginal Date - February 2019
#
# Type - Run RMarkdown summary and report templates
# Written/run on - RStudio
# Version of R - 3.5.1
#
# Description - Runs the Report and Summary markdown files
#
# Approximate run time - 1< minutes
#########################################################################

# RMarkdown Script

library("rmarkdown")
library("knitr")
source("config.R")
library('pryr')

folder_code_path <- paste0(code_filepath, "/folders.R")
source(folder_code_path)

## Create Summary

summary_markdown <- paste0(rmarkdown_filepath,"/ISD-NATIONAL-STATS-SUMMARY.Rmd")

summary_output <- 
  paste0(output_summary_filepath, "/summary.docx")

rmarkdown::render(summary_markdown, output_file = summary_output, encoding = "UTF-8")

# Please save the data files you want to publish such as Excel files into output -> datafile folder 
# before running the following script. As there are functions written to automatically detect data
# files' names and sizes for List of Tables. 

## Create Report

report_markdown <- paste0(rmarkdown_filepath,"/ISD-NATIONAL-STATS-REPORT.Rmd")

report_output <- 
  paste0(output_report_filepath, "/report.docx")

rmarkdown::render(report_markdown, output_file = report_output, encoding = "UTF-8")



