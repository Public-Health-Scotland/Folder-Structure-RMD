#########################################################################
# Name of file - folders.R
# Data release - Template
# Original Authors - Tina Fu, Rory Madigan, Ewout Jaspers
# Orginal Date - February 2019
#
# Type - Create folders for Markdown template to save files
# Written/run on - RStudio
# Version of R - 3.5.1
#
# Description - Runs the Report and Summary markdown files
#
# Approximate run time - 1< minutes
#########################################################################


dir.create(data_filepath, 
           recursive = FALSE, 
           showWarning = FALSE
)

dir.create(temp_filepath, 
           recursive = FALSE, 
           showWarning = FALSE
)

dir.create(output_filepath, 
           recursive = FALSE, 
           showWarning = FALSE
)

dir.create(output_summary_filepath, 
           recursive = FALSE, 
           showWarning = FALSE
)

dir.create(output_report_filepath, 
           recursive = FALSE, 
           showWarning = FALSE
)

dir.create(output_datafile_filepath, 
           recursive = FALSE, 
           showWarning = FALSE
)

