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
source("config.R")



## Create Summary

summary_markdown <- paste0(rmarkdown_filepath,"/ISD-NATIONAL-STATS-SUMMARY.Rmd")

summary_output <- 
  paste0(output_filepath, "/summary.docx")

rmarkdown::render(summary_markdown, output_file = summary_output)

## Create Report

report_markdown <- paste0(rmarkdown_filepath,"/ISD-NATIONAL-STATS-REPORT.Rmd")

report_output <- 
  paste0(output_filepath, "/report.docx")

rmarkdown::render(report_markdown, output_file = report_output)

