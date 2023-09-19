Tab_Export_CytoflexSRT <-
  #Define tab for generating images
  tabItem(tabName = "Export_CytoflexSRT",
    fluidRow(
      box(title = span(icon("image"),"Export a separate image of each parameter for each instrument"),
          background = "light-blue",
          width = 6,
            h4("Select a destination directory with 'Choose directory' and click 'Export image'"),
            h4("Based on the data from your last Pre-processing run"),
            h4("May take a few minutes"),
            actionButton("Export_Button_CytoflexSRT",
                        label = "Press to generate images")),
      #Define tab for download Excel
      box(title = span(icon("table"),"Export data"),
              background = "teal",
              side = "left",
              width = 6,
              h4("Click 'Export data' to download an Excel sheet of the data obtained during your last pre-processing run"),
              uiOutput("Excel_Download_CytoflexSRT")),
      ))
