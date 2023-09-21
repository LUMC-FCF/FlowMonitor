#Importing button for the BD import page
observeEvent(input$Importing_Button_BD, {
  showModal(modalDialog(h2("Importing is running..."),))
  results_import <- tryCatch({
    File.List.BD_All <- ImportData(FilePattern = "*.cst",
                               DirSelect = dirname(),
                               case_ignore = TRUE,
                               Recursive = TRUE)
    save(File.List.BD_All, file = "BDList.RData")
    load("BDList.RData", envir = .GlobalEnv)
    showNotification(ui = "Importing was succesfull :)",
                     duration = 5,
                     type = "message")
  }, error = function(err) {
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




# - Function used for pre-processing button on importing tab -
observeEvent(input$Pre_Processing_Button_BD, {
  showModal(modalDialog(h2("Pre-Processing is running..."),))
  results <- tryCatch({
    rmarkdown::render(
      input = paste0("rmarkdown/BDFullScriptPre-ProcessingV2.Rmd"),
      output_file = "BDFullScriptPre-Processing.html")
    load("rmarkdown/BD.RData", envir = .GlobalEnv)
    load("rmarkdown/Wide.Table.BD.RData", envir = .GlobalEnv)
    showNotification(ui = "Pre-Processing was succesfull :)",
                     duration = 5,
                     type = "message")
  }, error = function(err) {
    showNotification(ui = "Pre-Processing has Failed :(",
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
output[["Rename_Excel_BD"]]<- renderUI({

  downloadHandler(
    filename = function() {
      "RenameBD.xlsx"
    },
    content = function(file) {
      Old_Excel_Names <- Generate_renamedf(ColumntoRename = TableFinal_BD$Laser_Detector)
      Download_renameExcel(ExcelFile = Old_Excel_Names,
                           DownloadpathExcel = file)
    }
  )
})


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
      input = paste0("rmarkdown/BD_Rename.Rmd"),
      output_file = "BDRename.html")
    load("rmarkdown/BDRename.RData", envir = .GlobalEnv)
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


