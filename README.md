# FlowMonitorPrivate
FlowMonitor is an application used to visualize Flow Cytometry QC data. 
Currently, it is working for QC data generated by Cytek instruments, the Beckman Coulter SRT and BD instruments running FACSDiva software. More instruments will be added in the future.

# Data requirements
Flowmonitor uses the .csv (Aurora/CytoFLEX SRT) or .cst files (BD FACSDiva) generated during each QC. For details on where these files are usually located please see the "help" tab in FlowMonitor
In order for FlowMonitor to recognize your QC files, there is a few requirements on how you organize your data:
1. Store date from each instrument in a separate folder starting with "Data_" (for example "Data_Aurora 5L1). Everything after Data_ will be used as instrument name in the app.
2. If you want to plot more than one instrument at a time, put folders with data from the same vendor in one folder. This folder may not contain any other folders. 


# How Install application 
You need to perform the installation only once, if the installation fails due because some dependencies fail to install, please see below. 

Step 1: Install the package devtools and open the package library (if devtools is not already installed) by running the following code in your console:
```
Install.packages(“devtools”)
library(devtools)
```

Step 2: Install FlowMonitor 
```
devtools::install_github("LUMC-FCF/FlowMonitorApp", auth_token = "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", dependencies = TRUE) 
```

# Run the application
Step 3: Start FlowMonitor 
```
library(FlowMonitorApp)
FlowMonitorApp::StartApp()
```


# Notes: 
* Please note that the data pre-processing may take > 10 minutes. The preprocessed data is saved, however, so as long as you do not want to include new data, you do not need to run preprocessing again. Storing data on you PC instead of on a network drive may speed up the processing.
* FlowMonitor does removes some corrupt files (i.e. made with the wrong data/time settings), but there may be arrors we have not encountered before.
* QC files are located in the following folders: 
* Cytek Aurora: "C:\CytekbioExport\Setup" (one .csv per QC)
* BD FACSDiva: "D:\BD\FACSDiva\CST\LogFiles" (one .log file per month)
* We use RoboCopy to automatically transfer QC files to a network location, please contact us if you want to an SOP on how we use RoboCopy. 


# Troubleshooting the installation
If the installation fails because some packages cannot be installed, you can try to install them using the following commands:
```
if(!require(data.table)) { install.packages("data.table"); library(data.table) }
if(!require(dplyr)) { install.packages("dplyr"); library(dplyr) }
if(!require(reshape2)) { install.packages("reshape2"); library(reshape2) }
if(!require(stringr)) { install.packages("stringr"); library(stringr) }
if(!require(tidyr)) { install.packages("tidyr"); library(tidyr) }
if(!require(lubridate)) { install.packages("lubridate"); library(lubridate) }
if(!require(readr)) { install.packages("readr"); library(readr) }
if(!require(tidyverse)) { install.packages("tidyverse"); library(tidyverse) }
if(!require(ggplot2)) { install.packages("ggplot2"); library(ggplot2) }
if(!require(viridis)) { install.packages("viridis"); library(viridis) }
if(!require(rmarkdown)) { install.packages("rmarkdown"); library(rmarkdown) }
if(!require(plotly)) { install.packages("plotly"); library(plotly) }
if(!require(scales)) { install.packages("scales"); library(scales) }
if(!require(scales)) { install.packages("shinydashboard"); library(shinydashboard) }
if(!require(scales)) { install.packages("writexl"); library(writexl) }
if(!require(scales)) { install.packages("shinyFiles"); library(shinyFiles) }
if(!require(scales)) { install.packages("stringr"); library(stringr) }
if(!require(scales)) { install.packages("hms"); library(hms) }
if(!require(scales)) { install.packages("openxlsx"); library(openxlsx) }
if(!require(scales)) { install.packages("gtools"); library(gtools) }
```

If packages are missing or not updated, and running the above does not work, you can install/update packages manually in RStudio (in Tools). 
If you cannot update a package because it is in use, as a last resort you can quit R and remove the package from the library on your C-drive
