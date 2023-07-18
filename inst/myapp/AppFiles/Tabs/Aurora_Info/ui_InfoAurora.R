Tab_Info_Aurora <-
  tabItem(tabName = "qc_information_aurora",
    fluidRow(
    #Define button
     box(
        title = "Pre-Processing Aurora instruments",
        background = "light-blue",
        width = 6,
        h4(strong("Before visualization of the QC data, the QC data is processed and merged into a single data table.")),
        h4(strong("Pre-Processing involves the following steps:")),
        h4("1. The Pre-Processing script for the Aurora instruments accepts .csv files, by pressing the import button these files are imported so they are ready for Pre-Processing."),
        h4("2. The files are then split into 3 tables containing the data of interest."),
        h4("3. These Tables are merged together into a single data table."),
        h4("4. Pass/Fail requirements are applied."),
        h4("5. Instrument names are based on file and directory names"),
        h4(strong("Duration Pre-Processing:")),
        h4("Pre-Processing takes approximately 1 minute for 1834 files for 5 instruments (1 year worth of data per instrument).")
    ),

    box(
      title = "Parameter information",
      background = "aqua",
      width = 6,
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
        width = 6,
          h4(strong("The Aurora and Nothern light instruments have a pass and fail filter.")),
          h4(strong("Requirements the pass and fail were based on for Aurora instruments:")),
          h4("- UV  -> Gain Change < 100"),
          h4("- %rCV -> Max 6 (UV3, V3, B3, YG3, R3) OR (8 for FSC/SSC)"),
      )))

