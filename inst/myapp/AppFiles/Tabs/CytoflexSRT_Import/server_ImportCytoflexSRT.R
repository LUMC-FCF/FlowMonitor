#Importing button for the Cytoflex import page, when button is pushed importing starts
observeEvent(input$Importing_Button_CytoflexSRT, {
    showModal(modalDialog(h2("Importing is running..."),))
    results_import <- tryCatch({
        File.List.CytoflexSRT_All <- ImportData(FilePattern = "QC.*.csv",
                                                DirSelect = dirname(),
                                                case_ignore = TRUE,
                                                Recursive = TRUE)
        save(File.List.CytoflexSRT_All, file = "CytoflexSRTList.RData")
        load("CytoflexSRTList.RData", envir = .GlobalEnv)
        showNotification(ui = "Importing was succesfull :)",
                         duration = 5,
                         type = "message")
    },error = function(err) {
        showNotification(ui = "Importing has Failed :(",
                         duration = 10,
                         type = "error")
        showNotification(ui = as.character(err),
                         duration = 10,
                         type = "error")
        print(err)
        return(NULL)
        
    })
    removeModal()
}, ignoreInit = TRUE)


#Downloading a rename file based on Laser/Detector column
output[["Rename_Excel_CytoflexSRT"]]<- renderUI({
    
    downloadHandler(
        filename = function() {
            "RenameCytoflexSRT.xlsx"
        },
        content = function(file) {
            Old_Excel_Names_CytoflexSRT <- Generate_renamedf(ColumntoRename = TableFinal_CytoflexSRT$Laser_Detector)
            Download_renameExcel(ExcelFile = Old_Excel_Names_CytoflexSRT,
                                 DownloadpathExcel = file)
        }
    )
})


# Function used for pre-processing button on importing tab, when button is pushed pre-processing is started
observeEvent(input$Pre_Processing_Button_CytoflexSRT, {
    showModal(modalDialog(h2("Pre-Processing is running..."),))
    results <- tryCatch({
        rmarkdown::render(
            input = paste0("rmarkdown/CytoflexSRTFullScriptPre-Processing.Rmd"),
            output_file = "CytoflexSRTFullScriptPre-Processing.html")
        load("rmarkdown/CytoflexSRT.RData", envir = .GlobalEnv)
        load("rmarkdown/Wide_Table_CytoflexSRT.RData", envir = .GlobalEnv)
        showNotification(ui = "Pre-Processing was succesfull :)",
                         duration = 5,
                         type = "message")
    }, error = function(err)  {
        showNotification(ui = "Pre-Processing has Failed :(",
                         duration = 10,
                         type = "error")
        showNotification(ui = as.character(err),
                         duration = 10,
                         type = "error")
        return(NULL)
    })
    removeModal()
}, ignoreInit = TRUE)


#Import of Excel file and rename Excel file renaming file Excel
observeEvent(input$File_Select_Excelname, {
  Excel_File_Rename <- ExcelRead(Input_Read = input$File_Select_Excelname$datapath)
  save(Excel_File_Rename, file = "Rename_Excel_File.RData")
  load("Rename_Excel_File.RData", envir = .GlobalEnv)
})


#Converting names in dataframe
# - Function used for pre-processing button on importing tab -
observeEvent(input$Name_Convert, {
  showModal(modalDialog(h2("Renaming is running..."),))
  ResultsExcekNow <- tryCatch({
    rmarkdown::render(
      input = paste0("rmarkdown/CytoflexSRT_Rename.Rmd"),
      output_file = "CytoflexSRTRename.html")
    load("rmarkdown/CytoflexSRT_Rename.RData", envir = .GlobalEnv)
    showNotification(ui = "Renaming was succesfull :)",
                     duration = 5,
                     type = "message")
  }, error = function(err) {
    showNotification(ui = "Renaming has Failed :(",
                     duration = 10,
                     type = "error")
    showNotification(ui = as.character(err),
                     duration = 10,
                     type = "error")
    print(err)
    return(NULL)
  })
  removeModal()
}, ignoreInit = TRUE)