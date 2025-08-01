# Define UI ----
#Getting sources
source("Tabs/Welcome/ui_Welcome.R",local=TRUE)
source("Tabs/Aurora_Import/ui_ImportAurora.R", local = TRUE)
source("Tabs/Aurora_Plots/ui_PlotsAurora.R", local = TRUE)
source("Tabs/Aurora_Export/ui_ExportAurora.R", local = TRUE)
source("Tabs/Aurora_Info/ui_InfoAurora.R", local = TRUE)
source("Tabs/BD_Import/ui_ImportBD.R", local = TRUE)
source("Tabs/BD_Plots/ui_PlotsBD.R", local = TRUE)
source("Tabs/BD_Export/ui_ExportBD.R", local = TRUE)
source("Tabs/BD_info/ui_InfoBD.R", local = TRUE)
source("Tabs/BDLyric_Import/ui_ImportBDLyric.R", local = TRUE)
source("Tabs/BDLyric_Plots/ui_PlotsBDLyric.R", local = TRUE)
source("Tabs/BDLyric_Export/ui_ExportBDLyric.R", local = TRUE)
source("Tabs/BDLyric_info/ui_InfoBDLyric.R", local = TRUE)
source("Tabs/CytoflexSRT_Import/ui_ImportCytoflexSRT.R", local = TRUE)
source("Tabs/CytoflexSRT_Plots/ui_PlotsCytoflexSRT.R", local = TRUE)
source("Tabs/CytoflexSRT_Export/ui_ExportCytoflexSRT.R", local = TRUE)
source("Tabs/CytoflexSRT_Info/ui_InfoCytoflexSRT.R", local = TRUE)
source("Tabs/Help/ui_Help.R")

# UI variable is defined with dashboardpage, an overall header is defined, as well as the sidebar and corresponding menu times. 
ui <- dashboardPage(skin = "blue",
                    dashboardHeader(title = "FlowMonitor"),
                    dashboardSidebar( 
                      sidebarMenu(
                        menuItem("Welcome",
                                 tabName = "Welcome",
                                 icon = icon("info")
                        ),
                        menuItem("Cytek",
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
                        menuItem("BD (FACSDiva)",
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
                       menuItem("BD (Chorus)",
                                 icon = icon("bars"),
                                 menuSubItem("Importing", 
                                             tabName = "importing_bdLyric", 
                                             icon = icon("arrow-up")),
                                 menuSubItem("QC visualization",
                                             tabName = "visualization_data_QC_bdLyric",
                                             icon = icon("chart-line")),
                                 menuSubItem("Export",
                                             tabName = "Export_bdLyric",
                                             icon = icon("image")),
                                 menuSubItem("Information",
                                             tabName = "qc_information_bdLyric",
                                             icon = icon("info"))
                        ),                       
                        
                        menuItem("BCoulter CytoFLEX",
                                 icon = icon("bars"),
                                 menuSubItem("Importing", 
                                             tabName = "importing_CytoflexSRT", 
                                             icon = icon("arrow-up")),
                                 
                                 menuSubItem("QC visualization",
                                             tabName = "visualization_data_QC_CytoflexSRT",
                                             icon = icon("chart-line")),
                                 menuSubItem("Export",
                                             tabName = "Export_CytoflexSRT",
                                             icon = icon("image")),
                                 menuSubItem("Information",
                                             tabName = "qc_information_CytoflexSRT",
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
                        Tab_Welcome,
                        Tab_Import_Aurora,
                        Tab_Plots_Aurora,
                        Tab_Export_Aurora,
                        Tab_Info_Aurora,
                        Tab_Import_BD,
                        Tab_Plots_BD,
                        Tab_Export_BD,
                        Tab_Info_BD,
                        Tab_Import_BDLyric,
                        Tab_Plots_BDLyric,
                        Tab_Export_BDLyric,
                        Tab_Info_BDLyric,
                        Tab_Import_CytoflexSRT,
                        Tab_Plots_CytoflexSRT,
                        Tab_Export_CytoflexSRT,
                        Tab_Info_CytoflexSRT,
                        Tab_Help
                        
                      )))





