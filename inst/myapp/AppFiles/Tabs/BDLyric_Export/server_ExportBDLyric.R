#Excel generation button 
output[["Excel_Download_BDLyric"]]<- renderUI({
  is.null(input$Pre_Processing_Button_BDLyric)
  downloadHandler(
    filename = function() {
    "renamefiledataBDLyric.xlsx"
    },
    content = function(file4) {
      Download_renameExcel(ExcelFile = Wide_Table_BDLyric, DownloadpathExcel = file4)
    })
  })

# - Function used for export button on export tab - 
observeEvent(input$Export_button_BDLyric, {
  showModal(modalDialog(h2("Export is running..."),))
  results_export <- tryCatch({
    for (i in unique(TableFinal_BDLyric$FWparams)) {
      Loop_FWdata <-TableFinal_BDLyric[TableFinal_BDLyric$FWparams == i,]
      ExportAllImages(Columnparams = TableFinal_BDLyric$FWparams, 
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
