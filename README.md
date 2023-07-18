# FlowMonitorPrivate
FlowMonitor is an application used to visualize Flow Cytometry QC data. 

(private version for final report, will not be updated by FCF as of 18-07-2023)

# How to install application 
Step 1: Firstly, install the package devtools and open the package library (if devtools is not already installed):
- Command Install.packages(“devtools”)
- library(“devtools”)

Step 2: Install the application 
devtools::install_github("LUMC-FCF/FlowMonitorApp", auth_token = "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", dependencies = TRUE) 

Step 3: Start the application 
library(“FlowMonitorApp”)
FlowMonitorApp::StartApp()

# If package produces error as a result of packages. run the following code 
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
```
library(data.table)
library(dplyr)
library(tidyr)
library(lubridate)
library(readr)
library(reshape2)
library(tidyverse)
library(ggplot2)
library(viridis)
library(rmarkdown)
library(plotly)
library(scales)
library(shinydashboard)
library(writexl)
library(shinyFiles)
library(shiny)
library(stringr)
library(hms)
library(ggnewscale)
library(openxlsx)
library(gtools)
```

If Packages are missing or not updated, and running the above does not work, install and update packages manually with RStudio.

# Get Started 
1. Save your QC files on your PC, make sure you "Data_" in the directories files are saved under. 
2. Select a directory with the directory selector.
3. Press the Import files button.
4. Press the Pre-Processing button. 
