# RMarkdown
R markdown scripts for the publication template (summary and full report). 

1. The National_Template.docx is used as a template for ISD-NATIONAL-STATS-SUMMARY.Rmd. The NATIONAL_STATS_REPORT_TEMPLATE.docx is used as a template for ISD-NATIONAL-STATS-REPORT.Rmd. 

2. After knitted the document from ISD-NATIONAL-STATS-REPORT.Rmd, you have to add the cover page manually. The steps are as follows:
2.1 Go to Insert - Cover Page. Choose a random cover page, and clear all the contents on it. 

2.2 Double click on the footer of the second page (the next page after cover page). Choose Design - Page Number - Format Page Numbers. For page numbering, choose "Start at:" and set the value as 0. Thus the second page will have the page number 1 as we want. 

2.3 For the cover page, copy and paste the header and footer from the cover page in the "NATIONAL_STATS_REPORT.docx". 

3. For Table of Contents, you may need to add it manually as well. Go to References - Table of Contents. This is something we need to explore further. I have included the creation of TOC in ISD-NATIONAL-STATS-REPORT.Rmd, however it won't format nicely with the dots in the middle. 

4. Please feel free to change the ggplot2 codes according to the type of chart you want to create and formattings you would like to apply. 

