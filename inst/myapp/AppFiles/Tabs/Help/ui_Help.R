Tab_Help<- 
  tabItem(tabName = "Help",
    fluidRow(
      box(
        title = span(icon("circle-info"), strong("General information")),
        background = "blue",
        width = 6,
          h4("The application allows for visualization of quality control data from Aurora, Nothern light and BD instruments."),
          h4(strong("General features: ")),
          h4("- Visualization quality control data from Aurora, Nothern light and BD instruments."),
          h4("- Pre-Processing of quality control data."),
          h4("- Downloading your graphs."),
          h4("- Exporting images for every parameter based on your latest dataset."),
          h4("- Downloading an Excel file based on your latest dataset.")
      ),
     box(
       title = span(icon("circle-info"), strong("How does it work?")),
       background = "aqua",
       width = 6,
        h4("The application imports quality control files (.cst or .csv files). The collection of files will be put through Pre-Processing. 
             Pre-Processing converts the files into one data table, that is then used to visualize the data. The data table is also used
             as input for downloading images based on all parameters present in the data, and it is also used to Export an Excel file.")),
     box(
       title = span(icon("circle-info"), strong("Plotting your data")),
       background = "purple",
       width = 6,
        h4("- Plotting of the data is based on the parameters present in the data table."),
        h4("- Data filtered first (Example: Instrument -> Parameter -> Laser -> Detector)."),
        h4("- Press the 'Generate Plot' button to plot your data."),
        h4("- The application also allows you to edit several elements of your plot: the plot title, the y-axis label and adding vertical and horizontal lines (as well as their names in the legend, and their position)."),
        h4("- Switch to 'Detailed plot' to hover over datapoints. The plot will provide a description of the exact x and y values."),
        h4("- Press 'Download image' to download an image of your standard plot. To download the detailed plot, press the camera icon on the plot.")
      ),
     box(
       title = span(icon("bug"), strong("Known errors and bugs")),
       background = "red",
       width = 6,
        h4(strong("Pre-Processing bugs:")),
        h4("- If the directory that contains the files does not contain 'Data_', Pre-Processing will generate an error."),
        h4("- If subdirectories are stored in one main directory, make sure the main directory DOES NOT contain 'Data_', this will produce an error."),
        h4("- Aurora files generated before the year 2000 will generate errors during Pre-Processing."),
        h4(strong("Plotting data bugs:")),
        h4("- The 'Download image' button is only able to be used when the standard plot is being viewed, if the Detailed plot option is selected, downloading the plot will fail.")
      ),
      box(
        title = span(icon("bug"), strong("What do to when you get an error?")),
        background = "orange",
        width = 6,
         h4(strong("If you get an error while using the application:"),
         h4("- If the error occurs while Pre-Processing, make sure the naming of directories, subdirectories and files is correct.")),
         h4("- If the error persists, save the file that produced the error (if it is unclear which file caused the error, save all data)."),
         h4("- Send your data and preferably an screenshot of the error message to Tamar Tak of the Flow Core Facility at the Leiden University Medical Center."),
         h4("- The error will be analyzed and an attempt will be made to solve the error, you will be updated as soon as possible."),
         h4("- If the error occurs while using the application, send Tamar Tak a screenshot of the error message, and a description of your data.")
     ),
     
    box(
       title = span(icon("address-book"), strong("Contact")),
       background = "teal",
       width = 12,
        h4(strong("Developer:")),
        h4("Britt Kolen, BSc"),  
        h4(strong("Contact for errors:")),
        h4("Tamar Tak, PhD"),
        h4("Department: Flow Core Facility Leids University Medical Center"),
        h4("E-mail: t.tak@lumc.nl")
     ),
     
     
  ))
