#Getting dirname() to access computer system for direcory selection
volumes = getVolumes()()
shinyDirChoose(input, 'Importing_input', roots = volumes)
dirname <- reactive({parseDirPath(volumes, input$Importing_input)})
observe({
  if (!is.null(dirname)) {
    print(dirname())
    output$Importing_input <- renderText(dirname())}
})


#Importing button for the Aurora import page, when button is pushed importing starts
observeEvent(input$Importing_Button_Aurora, {
  showModal(modalDialog(h2("Importing is running..."),))
    results_import <- tryCatch({
      File.List.Aurora_All <- ImportData(FilePattern = "DailyQC.*.csv",
                                         DirSelect = dirname(),
                                         case_ignore = TRUE,
                                         Recursive = TRUE)
    save(File.List.Aurora_All, file = "AuroraList.RData")
    load("AuroraList.RData", envir = .GlobalEnv)
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


# Function used for pre-processing button on importing tab, when button is pushed pre-processing is started
observeEvent(input$Pre_Processing_Button_Aurora, {
  showModal(modalDialog(h2("Pre-Processing is running..."),))
   results <- tryCatch({
   rmarkdown::render(
    input = paste0("rmarkdown/AuroraFullScriptPre-Processing.Rmd"),
    output_file = "AuroraFullScriptPre-Processing.html")
    load("rmarkdown/Aurora.RData", envir = .GlobalEnv)
    load("rmarkdown/Wide_table.RData", envir = .GlobalEnv)
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
