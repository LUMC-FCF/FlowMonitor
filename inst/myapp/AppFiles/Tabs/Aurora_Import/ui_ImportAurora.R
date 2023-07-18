Tab_Import_Aurora <-
  #Define tab for importing list of QC files
  tabItem(tabName = "importing_aurora",
    fluidRow(
      box(title = span(icon("file-import"), "Step 1: Import data from Cytek Aurora and Northern lights instruments"),
          background = "light-blue",
          width = 6,
            h4("Select the location of your QC data with 'Select Directory' on the left. Please ensure data from each instrument are stored in a separate folder containing 'Data_' in its' name (see help for more information)."),
            h4(strong("Click 'Import data' to import all files into the R environment")),
            actionButton("Importing_Button_Aurora",
              label = "Click here to import .csv files")),
      #Define tab for Pre-Processing button
       box(title = span(icon("spinner"), "Step 2: Pre-Processing"),
          background = "aqua",
          width = 6,
            h4(strong("Click 'Process data' to process the QC data into a usable format. ")),
            h4("This will merge all .csv files into one large table, remove corrupted files and apply pass/fail criteria. Please note that this may take a few minutes. Please be patient as this may take a few minutes."),
            h4(strong("After pre-processing is complete, you can continue to plotting or exporting your data.")),
            actionButton("Pre_Processing_Button_Aurora",
              label = "Click here to start Pre-processing")),

      )
)
