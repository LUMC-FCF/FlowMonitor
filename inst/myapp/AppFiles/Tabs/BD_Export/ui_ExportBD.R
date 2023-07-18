Tab_Export_BD <- 
  tabItem(tabName = "Export_bd",
    fluidRow(
      box(title = span(icon("image"), "Export a separate image of each parameter for each instrument"),
          background = "orange",
          width = 6,
          h4("Select a destination directory with 'Choose directory' and click 'Export image'"),
          h4("Based on the data from your last Pre-processing run"),
          h4("May take a few minutes"),
            actionButton("Export_button_BD",
                        label = "Press to generate images")),
            
      box(title = span(icon("table"),"Export data"),
          background = "light-blue",
          side = "left",
          width = 6,
          h4("Click 'Export data' to download an Excel sheet of the data obtained during your last pre-processing run"),
            uiOutput("Excel_Download_BD")),
      ))
