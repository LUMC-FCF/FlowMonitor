Tab_Info_CytoflexSRT <-
  tabItem(tabName = "qc_information_CytoflexSRT",
    fluidRow(
    #Define button
     box(
        title = "Pre-Processing CytoflexSRT instruments",
        background = "light-blue",
        width = 12,
        h4(strong("Before visualization of the QC data, the QC data is processed and merged into a single data table.")),
        h4(strong("Pre-Processing involves the following steps:")),
        h4("1. The Pre-Processing script for the CytoflexSRT instruments accepts .csv files. It will look for any file that has QC in its name and ends with .csv"),
	h4("by pressing the import button these files are imported so they are ready for Pre-Processing."),
        h4("2. The files are then split into 3 tables containing the data of interest."),
        h4("3. These Tables are merged together into a single data table."),
        h4("4. Pass/Fail requirements are applied."),
        h4("5. Instrument names are based on file and directory names"),
        h4(strong("Duration Pre-Processing:")),
        h4("Pre-Processing takes approximately 1 minute for 1500 files.")
    ),

    box(
      title = "Parameter information",
      background = "aqua",
      width = 12,
        h4(strong("The application allows for plotting of different parameters measured during QC")),
        h4(strong("Possible parameters:")),
        h4("- Gain (Adjustments the detector needs to make in order to reach reference value.)"),
        h4("- Delta Gain (The difference between the reference value and the baseline.)"),
        h4("- Gain Change (The difference between the current gain and the gain from the previous QC report, calculated as a percentage.)"),
        h4("- Median (Relative reference value for detectors of QC beads set by instrument.)"),
        h4("- %rCV (The width of the signal when sample is measured.)"),
        h4("- Sensitivity (The difference between a positive measurement and background.)"),
        h4("- (FSC) Area Scaling Factor"),
        h4("- Laser Power (Strength of the laser, may decrease over time.)"),
        h4("- Laser Delay (Time it takes for samples to reach the lasers.)"),
        h4("- Flow Rate (The speed with which the fluid moves through the system.)"),
        h4("- Temperature (The temperature of the system.)"),
        h4("- Area Scaling Factor (The relationship between the area and height of a measurement.)")
      ),

      box(
       title = "Requirments for Pass/Fail",
        background = "teal",
        width = 12,
          h4(strong("The Pass/Fail criteria are included in the .csv file")),
	  h4("The default criteria are:"),
          h4("- Delay: -5.00µs ≤ Difference Delay ≤ 5.00µs"),
 	  h4("- Gain: -20.00% ≤ %Difference Target Gain ≤ 20.00%"),
 	  h4("- Median: -5.00% ≤ %Difference Target Median ≤ 5.00%"),
 	  h4("- rCV: rCV(%) ≤ 5.00%"),
          
      )))