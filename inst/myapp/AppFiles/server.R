
# Define server logic ----
server <- function(input, output, session) {
#Get Sources
source("Tabs/Aurora_Import/server_ImportAurora.R", local = TRUE)
source("Tabs/Aurora_Plots/server_PlotsAurora.R", local = TRUE)   
source("Tabs/Aurora_Export/server_ExportAurora.R", local = TRUE)  
source("Tabs/BD_Import/server_ImportBD.R", local = TRUE)
source("Tabs/BD_Plots/server_PlotsBD.R", local = TRUE)
source("Tabs/BD_Export/server_ExportBD.R", local = TRUE)
 }
