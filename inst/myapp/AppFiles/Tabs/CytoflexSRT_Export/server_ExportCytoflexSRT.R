#Excel generation button, generates Excel when button is pushed
output[["Excel_Download_CytoflexSRT"]]<- renderUI({
  is.null(input$Pre_Processing_Button_CytoflexSRT)
  Wide_Table_CytoflexSRT
  downloadHandler(
    filename = function() {
    "renamefile.xlsx"
    },
    content = function(file) {
      Download_renameExcel(ExcelFile = Wide_Table_CytoflexSRT, DownloadpathExcel = file)
    })
  })

#Export button images, generates collection of images based on column when button is pushed
observeEvent(input$Export_Button_CytoflexSRT, {
  showModal(modalDialog(h2("Export is running..."),))
  Results_Export_Aurora <- tryCatch({
    for (i in unique(TableFinal_CytoflexSRT$FWparams)) {
      Loop_FWdata <-TableFinal_CytoflexSRT[TableFinal_CytoflexSRT$FWparams == i,]
      ExportAllImages(Columnparams = TableFinal_CytoflexSRT$FWparams,
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
