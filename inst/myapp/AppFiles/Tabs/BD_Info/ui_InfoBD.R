Tab_Info_BD <- 
  tabItem(tabName = "qc_information_bd",
    fluidRow(
      box(
        title = "Pre-Processing BD instruments",
        background = "orange",
        width = 6,
          h4(strong("Before visualization of the QC data, the QC data is processed and merged into a single data table.")),
          h4(strong("Pre-Processing involves the following steps:")),
          h4("1. The Pre-Processing script for the BD instruments accepts .log files, by pressing the import button, these files are imported so they are ready for Pre-Processing."),
          h4("2. The script looks for start and stop identifiers in the .log files, the scripts starts looping over the files, extracting 6 tables."),
          h4("3. These Tables are merged together into a single data table."),
          h4("4. Instrument names are based on directory names"),
          h4("5. The script does not contain pass/fail requirements, the .log files do not contain the necessary data to determine whether a QC passed of failed."),
          h4("6. Some parameters are not present in the application, due to the fact that the .log files do not contain these parameters."),
          h4(strong("Duration Pre-Processing:")),
          h4("Pre-Processing takes approximately 6 minutes for 84 files for 7 instruments (1 year worth of data per instrument)."),
          h4("Pre-Processing for BD instruments can be a long wait. The reason behind this is the fact that the 6 loops present in the script take a while to finish looping over every single file (1 file contains a month's worth of data).")
     ),
    
     box(
       title = "Rename Excel",
       background = "light-blue",
       width = 6,
        h4("- For the BD instruments, Lasers and Detectors are filtered within the same filter, and not separately."),
        h4("- Detectors may differ in names between instruments, and name changes may occur. In order to make sure all detectors each have only one name, the detectors will have to be renamed using the Rename Excel function."),
        h4("- After Pre-Processing, an Excel file with two columns: OldName and NewName can be downloaded. The OldName column contains all unique names that are present in the data table"),
        h4("- Fill in the desired names for each Detector/Laser in the NewName column, and use the file select option to import the edited Excel file back into the application."),   
        h4("- Press the rename button to rename your Detectors/Lasers"), 
        h4(strong("Note")), 
        h4("- It is recommended to remove any empty cells in the OldName column of the Excel file."), 
        h4("- Leaving any cell in the NewName column that is connected to a value in Oldname column empty, will return as an NA in your data table, 
          thus make sure to delete items in the OldName column if you are not renaming them."), 
        h4("- If the renaming will not start, make sure you have your Excel file saved and closed, this may be the issue."),
        h4("- If renaming the Detectors/Lasers went wrong, either download the Rename file again (this will display the new names in the OldName column.) 
          If this does not solve the mistake, re-run Pre-Processing.")
     ),
       
    box(
      title = "Parameter information",
      background = "aqua",
      width = 6,
        h4(strong("The application allows for plotting of different parameters measured during QC")),
        h4(strong("Possible parameters:")),
        h4("- %rCV (The spread of a measurement.)"),
        h4("- Median (The arbitrary number that detectors adjust towards.)"),
        h4("- (FSC) Area Scaling Factor"),
        h4("- Laser Delay (Time it takes for samples to reach the lasers.)"),
        h4("- Area Scaling Factor (The relationship between the area and height of a measurement.)"),
        h4("- Q (Short for background signal.)"),
        h4("- B (Short for quantum efficiency.)"),
        h4("- Delta rCV Square (Mid)"),
        h4("- Ref MFI (Bright)"),
        h4("- Normalization Factor"),
      ),
          
       
     ))
