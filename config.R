# R config 
library(here)

basefilepath <- here()
data_filepath <- file.path(basefilepath, "data")
temp_filepath <- file.path(basefilepath, "temp")
output_filepath <- file.path(basefilepath, "output")
output_summary_filepath <- file.path(basefilepath, "output/summary")
output_report_filepath <- file.path(basefilepath, "output/report")
output_datafile_filepath <- file.path(basefilepath, "output/datafile")
rmarkdown_filepath <- file.path(basefilepath, "rmarkdown")
code_filepath <- file.path(basefilepath, "code")
