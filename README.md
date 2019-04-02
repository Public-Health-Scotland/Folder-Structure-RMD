# RMarkdown
R markdown template for producing summary and full report. 

* To use this template, click on "Clone or download" -> "Download ZIP" and save it to your preferred folder.
![](https://github.com/Tina815/Images/blob/master/screenshot7.PNG)
* Go to the zip file, right click on it and choose WinZip -> Extract to here.
* After extracting, go to "RMarkdown-master" folder. Open up "RMarkdown.Rproj" in RStudio. Then follow the steps below:

1. You can see all the files listed in the Files panel in RStudio. Click on "rmarkdown" folder, you can 
see RMarkdown related files:

* You can open ISD-NATIONAL-STATS-SUMMARY.Rmd and ISD-NATIONAL-STATS-REPORT.Rmd to change the contents as you need for your summary and report, including relevant text, ggplot2 code to create charts. 

* In "ISD-NATIONAL-STATS-REPORT.Rmd", for Appendix 3 – Early Access Details, not every publication will have the information for “Early Access for Management Information” and “Early Access for quality assurance”. So each team should judge every time if these sections are needed. If not, please comment out (Ctrl+Shift+c) the relevant RMarkdown script so that the text will not show in the final output. 

![](https://github.com/Tina815/Images/blob/master/screenshot4.PNG)

* The NATIONAL_STATS_SUMMARY_TEMPLATE.docx is used as a template for ISD-NATIONAL-STATS-SUMMARY.Rmd. The NATIONAL_STATS_REPORT_TEMPLATE.docx is used as a template for ISD-NATIONAL-STATS-REPORT.Rmd. 

* The packages you need are: here, rmarkdown, knitr, pryr. Please check you have them installed. You can use 
install.packages("package name") to install them.

**2. After editting .Rmd files, go back to the main folder and open "Run.R" file. Run the whole script in Run.R file.**

3. Leave RStudio and go to the folder where you saved the zip file. You can find the Word document for summary in folder "output -> summary", and report in folder "output -> report".

4. Thus we have completed the RMarkdown steps. Then we need to carry out some manual steps which have not been automated in RMarkdown process for the "report.docx".

5. First of all, you need to add the cover page and its footer manually. Here are the 
steps to follow:

i.	Go to "rmarkdown" folder and open “Cover_Page_V5.docx”, press Ctrl + A to select all contents. Go to Insert – Cover Page – Save Selection to Cover Page Gallery. Give it a name (e.g. ISD_Publication_Report) and click OK. **This only needs to be set up once and it will always be in the gallery for future use.** 

![](https://github.com/Tina815/Images/blob/master/screenshot6.PNG)

ii.	Double click on the footer, and select the whole footer like this

![](https://github.com/Tina815/Images/blob/master/screenshot2.PNG)

Then go to Insert – Footer – Save Selection to Footer Gallery. Give it a name (e.g. ISD_Publication_Footer) and click OK. **This only needs to be set up once and it will always be in the gallery for future use.** Now you can close “Cover_Page_V5.docx”. 

iii.	Open report.docx. Go to Insert – Cover Page. Scroll down to the general section and select the cover page template you saved in step i. We can notice there appears a blank space above the text “Information Services Division”. To fix that, go to Page Layout – Margins – Custom Margins. Set the “Top” number as 0.62 cm. Now it should be back to the top. 

iv.	Go to Insert – Footer. Scroll down to the general section and select the footer template you saved in step ii. Thus the cover page has been fully inserted into the document. 

6. Table Formatting

i.	Since the tables in report.docx are not formatted by having border line, filled colour for column headers etc, we need to format the tables using VBA code. **Creating VBA code only needs to be set up once and it will always be in the macro list for future use.** Go to View – Macros – View Macros. Type a macro name as you want, and click Create. It will open up the VBA developer window. 

ii.	Copy the following code to the developer window and click Save button to save the macro (from Sub to End Sub). 

    Sub SetStyleOfAllTablesAndPreserveAlignment()
    ' SetStyleOfAllTablesAndPreserveAlignment Macro
    
        For Each objTable In ActiveDocument.Tables
            
            '******This first section is for recording the old column alignments*****'
            numCols = objTable.Columns.Count 'first find the number of columns within the table.
            ReDim oldColumnAlignments(numCols) As Integer 'initialize an integer array of length 'numCols'.
            column_index = 0
            For Each tableColumn In objTable.Columns
                oldColumnAlignments(column_index) = tableColumn.Cells(1).Range.ParagraphFormat.Alignment
                column_index = column_index + 1
            Next tableColumn
            '************************************************************************'
           
           
            '-------This section changes the styles of the tables to what they should be. -------'
            objTable.Style = "ISD_Pubs_Tables"
            PreviousBookmarkID = objTable.Range.PreviousBookmarkID
            PreviousBookmarkName = ActiveDocument.Range.Bookmarks(PreviousBookmarkID)
            
            If PreviousBookmarkName = "glossary" Then
                objTable.Style = "Glossary_Style"
            End If
            
            If PreviousBookmarkName = "tableA" Then 'Change these as needed for each style type!
                objTable.Style = "TableA_Style"
            End If
            
            If PreviousBookmarkName = "tableB" Then
                objTable.Style = "TableB_Style"
            End If
            
            If PreviousBookmarkName = "tableC" Then
                objTable.Style = "TableC_Style"
            End If
            '------------------------------------------------------------------------------------'
            
            
            '^^^^This last section sets the alignments of each column of the table to what they were ^^^^'
            '^^^^before the style of the table was changed.^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'
            i = 0
            For Each tableColumn In objTable.Columns
                tableColumn.Select
                Selection.ParagraphFormat.Alignment = oldColumnAlignments(i)
                i = i + 1
            Next tableColumn
            '^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^'
            
            objTable.PreferredWidth = 100 'Sets the Preferred Table width to 100% of the width of the page.
            
        Next objTable
    
    End Sub

iii.	You can close the developer window. Go to View – Macros – View Macros. Select the macro you created in step ii, and click Run. Thus all the tables in the output document should be nicely formatted. 

iv.	**This step is optional only if you want to apply more styles to some specific tables.** We currently have built in two table styles in the “NATIONAL_STATS_REPORT_TEMPLATE.docx”. The style named as “ISD_pubs_tables” is for all tables except Glossary, and the other named as “Glossary_Style” is for Glossary. You can create more styles if you want. To do that, open “NATIONAL_STATS_REPORT_TEMPLATE.docx”, click any cell of the table, and go to Design. Click on the down arrow in Table Styles. 

![](https://github.com/Tina815/Images/blob/master/screenshot3.PNG)

Click New Table Style. Give it a Name, and you can set the table format as you want. You can choose different settings for different table element in “Apply formatting to” dropdown list. Then click OK. Save and close the document. To apply the new style, you only need to replace the bookmark name with “tableA”, and the table style name you set with “TableA_Style” in the VBA code:

        If PreviousBookmarkName = "tableA" Then 'Change these as needed for each style type!
            objTable.Style = "TableA_Style"
        End If

Please note that the bookmark names are generated wherever you use “#” in the RMarkdown script for headings. Go to Insert – Bookmark, then you will see a list of all bookmark names in the document.

7. Table of Contents (TOC)

i.	We need to insert the TOC manually as we cannot find a way to insert it on a specific page in RMarkdown script. **Please note: this step should be done after running the macro setting the table formats. Otherwise it will make the bookmarks not in right order.** 

ii.	Click on the end of last text line on the page “This is a National Publication” (page number 1). 

![](https://github.com/Tina815/Images/blob/master/screenshot5.PNG)

Go to Insert – Page Break, so that a new blank page will be inserted. 

iii.	Go to References – Table of Contents. Choose Built-in template Automatic Table 1. Thus the TOC have been fully inserted. 



