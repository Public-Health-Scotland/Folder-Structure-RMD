# RMarkdown Script
source("config.R")

data_filepath <- file.path(basefilepath, "data")
temp_filepath <- file.path(basefilepath, "temp")
output_filepath <- file.path(basefilepath, "output")
output_figures_filepath <- file.path(basefilepath, "output/figures")
rmarkdown_filepath <- file.path(basefilepath, "rmarkdown")
scripts_filepath <- file.path(basefilepath, "code")

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

