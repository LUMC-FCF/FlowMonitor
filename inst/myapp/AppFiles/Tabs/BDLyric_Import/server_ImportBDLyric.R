#Importing button for the BDLyric import page
observeEvent(input$Importing_Button_BDLyric, {
  showModal(modalDialog(h2("Importing is running..."),))
  results_import <- tryCatch({
    File.List.BDLyric_All <- ImportData(FilePattern = "PQC Report",
                               DirSelect = dirname(),
                               case_ignore = TRUE,
                               Recursive = TRUE)
    save(File.List.BDLyric_All, file = "BDLyricList.RData")
    load("BDLyricList.RData", envir = .GlobalEnv)
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
observeEvent(input$Pre_Processing_Button_BDLyric, {
  showModal(modalDialog(h2("Pre-Processing is running..."),))
  results <- tryCatch({
    rmarkdown::render(
      input = paste0("rmarkdown/BDLyricScriptPre-Processing.Rmd"),
      output_file = "BDLyricScriptPre-Processing.html")
    load("rmarkdown/TableFinal_BDLyric.RData", envir = .GlobalEnv)
    load("rmarkdown/Wide_Table_BDLyric.RData", envir = .GlobalEnv)
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