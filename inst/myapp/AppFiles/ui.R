# Define UI ----
#Getting sources
source("Tabs/Aurora_Import/ui_ImportAurora.R", local = TRUE)
source("Tabs/Aurora_Plots/ui_PlotsAurora.R", local = TRUE)
source("Tabs/Aurora_Export/ui_ExportAurora.R", local = TRUE)
source("Tabs/Aurora_Info/ui_InfoAurora.R", local = TRUE)
source("Tabs/BD_Import/ui_ImportBD.R", local = TRUE)
source("Tabs/BD_Plots/ui_PlotsBD.R", local = TRUE)
source("Tabs/BD_Export/ui_ExportBD.R", local = TRUE)
source("Tabs/BD_info/ui_InfoBD.R", local = TRUE)
source("Tabs/Help/ui_Help.R")
# UI variable is defined with dashboardpage, an overall header is defined, as well as the sidebar and corresponding menu times. 
ui <- dashboardPage(skin = "blue",
dashboardHeader(title = "FlowMonitor"),
  dashboardSidebar( 
    sidebarMenu(
      menuItem("Aurora",
        icon = icon("bars"),
       menuSubItem("Importing", 
        tabName = "importing_aurora", 
        icon = icon("arrow-up")),
       menuSubItem("QC visualization",
        tabName = "visualization_data_QC",
        icon = icon("chart-line")),
       menuSubItem("Export",
        tabName = "Export_Aurora",
        icon = icon("image")),
       menuSubItem("Information",
        tabName = "qc_information_aurora",
        icon = icon("info"))
    ),
       menuItem("BD",
        icon = icon("bars"),
        menuSubItem("Importing", 
          tabName = "importing_bd", 
          icon = icon("arrow-up")),
        menuSubItem("QC visualization",
          tabName = "visualization_data_QC_bd",
          icon = icon("chart-line")),
        menuSubItem("Export",
          tabName = "Export_bd",
          icon = icon("image")),
        menuSubItem("Information",
          tabName = "qc_information_bd",
          icon = icon("info"))
     ),
    
       menuItem("Help",
          tabName = "Help",
          icon = icon("question"))
     ),
        div(style="text-align:center","Directory selection"),  
        column(width = 12, align = "Center", 
        shinyDirButton('Importing_input',label = 'Choose Directory',
        title = 'Choose Directory'))
    ),
 
# Defining the dashboard body
dashboardBody(
  #Tabitems for tabcontent 
  tabItems(
      Tab_Import_Aurora,
      Tab_Plots_Aurora,
      Tab_Export_Aurora,
      Tab_Info_Aurora,
      Tab_Import_BD,
      Tab_Plots_BD,
      Tab_Export_BD,
      Tab_Info_BD,
      Tab_Help
    
    )))
 




