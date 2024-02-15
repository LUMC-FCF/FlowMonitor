Tab_Info_BDLyric <- 
  tabItem(tabName = "qc_information_bdLyric",
    fluidRow(
      box(
        title = "Pre-Processing BD Lyric instruments",
        background = "orange",
        width = 6,
          h4(strong("Before visualization of the QC data, the QC data is processed and merged into a single data table.")),
          h4(strong("Pre-Processing involves the following steps:")),
          h4("1. The Pre-Processing script for the BD Lyric instruments is completely different from that for BD instruments running FACSDiva. Flowmonitor accepts .csv files that contain PQC Report in their name."),
          h4("2. Your instrument generates .csv files after every QC. It also creates AS files, which are currently ignored by FlowMonitor"),
          h4("3. Instrument names are based on directory names, data from each instrument should be put in a separate folder named Data_InstrumentName, where InstrumentName can be anything you like."),
          ),
      
       
    box(
      title = "Parameter information",
      background = "aqua",
      width = 6,
        h4(strong("The application allows for plotting of different parameters measured during QC")),
        h4(strong("Possible parameters:")),
        h4("- %rCV: The spread of a measurement."),
        h4("- PMTV: PMT Voltage required to reach target MFI"),
        h4("- (FSC) Area Scaling Factor: correction factor for scaling pulse height and area"),
        h4("- Laser Delay: Time it takes for samples to reach the lasers, relative to the blue laser."),
 	h4("- Laser power: Laser power in mW"),
	h4("- Laser current: Current going through laser in mA"),
        h4("- Area Scaling Factor (The relationship between the area and height of a measurement.)"),
        h4("- Qr:Short for quantum efficiency."),
        h4("- Br: Short for background signal."),
	h4("- Linearity: between which channels the relation between PMTV and median are linear, with a max 2% deviation. Min and max channels are reported"),
      ),
          
       
     ))
