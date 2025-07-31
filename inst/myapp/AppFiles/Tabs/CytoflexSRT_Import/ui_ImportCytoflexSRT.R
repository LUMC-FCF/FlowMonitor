Tab_Import_CytoflexSRT <-
  #Define tab for importing list of QC files
  tabItem(tabName = "importing_CytoflexSRT",
    fluidRow(
      box(title = span(icon("file-import"), "Step 1: Import data from Beckman Coulter Cytoflex instruments (including SRT and mosaic)"),
          background = "light-blue",
          width = 6,
            h4("Select the location of your QC data with 'Select Directory' on the left. Please ensure data from each instrument are stored in a separate folder containing 'Data_' in its' name (see help for more information)."),
            h4(strong("Click 'Import data' to import all files into the R environment")),
            actionButton("Importing_Button_CytoflexSRT",
              label = "Click here to import .csv files")),
      #Define tab for Pre-Processing button
       box(title = span(icon("spinner"), "Step 2: Pre-Processing"),
          background = "red",
          width = 6,
            h4(strong("Click 'Process data' to process the QC data into a usable format. ")),
            h4("This will merge all .csv files into one large table, remove corrupted files and apply pass/fail criteria. Please note that this may take a few minutes. Please be patient as this may take a few minutes."),
            h4(strong("After pre-processing is complete, you can continue to plotting or exporting your data.")),
            actionButton("Pre_Processing_Button_CytoflexSRT",
              label = "Click here to start Pre-processing")),

	box (title = span(icon("arrow-rotate-right"), "Step 3: Rename detectors or lasers if necessary"),
           background = "orange",
           width = 8, 
            h4(strong("When comparing multiple configurations with differences in detector names you can use this to rename certain detectors:")),
            h4("1.	Press 'Download' to download an excel file ('Cytoflex.xlsx') containing all detectors in your data. If you have prepared this table before, move to step 4."),
            h4("2.	Fill in the desired name in the column 'NewName'. Remove rows of detector you do not want to rename."),
            h4("3.	Save and close the excel file"),
            h4("4.	Load the excel file with renamed parameters using the file selector."),
            h4("5.	Click convert names"),
            uiOutput("Rename_Excel_CytoflexSRT"),
              fileInput("File_Select_Excelname", 
              label = " ", width = '40%'),
           actionButton("Name_Convert_CytoflexSRT",
                        label = "Convert Names")), 
      )
)
