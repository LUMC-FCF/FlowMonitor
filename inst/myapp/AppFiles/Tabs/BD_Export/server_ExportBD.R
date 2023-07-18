#Excel generation button 
output[["Excel_Download_BD"]]<- renderUI({
  is.null(input$Pre_Processing_Button_BD)
  downloadHandler(
    filename = function() {
    "renamefiledataBD.xlsx"
    },
    content = function(file4) {
      Download_renameExcel(ExcelFile = Wide_Table_BD, DownloadpathExcel = file4)
    })
  })

# - Function used for export button on export tab - 
observeEvent(input$Export_button_BD, {
  showModal(modalDialog(h2("Export is running..."),))
  results_export <- tryCatch({
    for (i in unique(TableFinal_BD$FWparams)) {
      Loop_FWdata <-TableFinal_BD[TableFinal_BD$FWparams == i,]
      ExportAllImages(Columnparams = TableFinal_BD$FWparams, 
                      DownloadpathImages = dirname(),
                      loopname =  Loop_FWdata,
                      loopid = i)}
  showNotification(ui = "Export was succesfull :)",
                  duration = 5,
                  type = "message")
    }, 
  error = function(err) {
  showNotification(ui = "Export has Failed :(",
                   duration = 10,
                   type = "error")
  showNotification(ui = as.character(err),
                   duration = 10,
                   type = "error")
  print(err)
  return(NULL)
   }) 
  removeModal()
},ignoreInit = TRUE)
