# FlowMonitor
FlowMonitor is an application used to visualize Flow Cytometry QC data. 
Currently, it is working for QC data generated by:
* Cytek Aurora & Northern Lights 
* Beckman Coulter Cytoflex (SRT)
* BD instruments running FACSDiva software
* BD instruments running FACSSuite

More instruments will be added in the future, currently the Sony ID7000, Standard Biotools Hyperion and the Quantiflash are under development.

## Data requirements
Flowmonitor uses the .csv (Aurora/CytoFLEX SRT/BD FACSSuite) or .cst files (BD FACSDiva) generated during each QC. For details on where these files are usually located please see the "help" tab in FlowMonitor
In order for FlowMonitor to recognize your QC files, there is a few requirements on how you organize your data:
1. Store date from each instrument in a separate folder starting with "Data_" (for example "Data_Aurora 5L1). Everything after Data_ will be used as instrument name in the app.
2. If you want to plot more than one instrument at a time, put folders with data from the same vendor in one folder. This folder may not contain any other folders. 


## Installation 
You need to perform the installation only once, if the installation fails due because some dependencies fail to install, please see below. 

Step 1: Install the package devtools and open the package library (if devtools is not already installed) by running the following code in your console:
```
Install.packages(“devtools”)
library(devtools)
```

Step 2: Install FlowMonitor 
```
devtools::install_github("LUMC-FCF/FlowMonitorApp", dependencies = TRUE) 
```

## Running the application
Step 3: Start FlowMonitor 
```
library(FlowMonitorApp)
FlowMonitorApp::StartApp()
```


## Notes: 
* Please note that the data pre-processing may take > 10 minutes. The preprocessed data is saved, however, so as long as you do not want to include new data, you do not need to run preprocessing again. Storing data on you PC instead of on a network drive will speed up the processing.
* FlowMonitor does removes some corrupt files (i.e. made with the wrong data/time settings), but there may be arrors we have not encountered before.
* QC files are located in the following folders: 
* Cytek Aurora: "C:\CytekbioExport\Setup" (one .csv per QC)
* BD FACSDiva: in the hidden folder "C:\ProgramData\BD\FACSDiva\CST\LJ" (one file per configuration) for recent PCs or "C:\Program Files\BD FACSDiva Software\CST\LJ" for older PCs.
* The CytoFLEX SRT does not automatically generate QC files, you can export them in the QC module by right clicking an old QC file and selecting Data Manager. Here, you can download all QC files in a certain date range. Make sure to deselect the configuration or bead lot if you want to export all files. 
* We use RoboCopy to automatically transfer QC files to a network location, please contact us if you want to an SOP on how we use RoboCopy. 


## Troubleshooting the installation
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
if(!require(writexl)) { install.packages("writexl"); library(writexl) }
if(!require(shinyFiles)) { install.packages("shinyFiles"); library(shinyFiles) }
if(!require(stringr)) { install.packages("stringr"); library(stringr) }
if(!require(hms)) { install.packages("hms"); library(hms) }
if(!require(openxlsx)) { install.packages("openxlsx"); library(openxlsx) }
if(!require(gtools)) { install.packages("gtools"); library(gtools) }
if(!require(pandoc)) { install.packages("pandoc"); library(pandoc) }
```

If packages are missing or not updated, and running the above does not work, you can install/update packages manually in RStudio (in Tools). 
If you cannot update a package because it is in use, as a last resort you can quit R and remove the package from the library on your C-drive

# Set up automated transfer of QC files to a network drive
To be able to access QC data from all your instruments from a central location, you need to copy QC files to a network drive. We've set up a system that will automatically transfer QC files to a network drive each time a user logs in to the instruments PC. 
Please note that you will need Administrator rights to set this up, you may need to adapt fie locations and that some instruments (e.g. the CytoFLEX SRT) require manual exporting of QC data.

### Set up Robocopy
Download [WinRoboCopy](http://www.upway2late.com/#/projects/winrobocopy) and fill in the following parameters:
* Name: Choose a name of your liking
* From: Location of the QC data, for the different instruments, this is
  - Cytek Aurora: C:\CytekbioExport\Setup	C:\ProgramData\BD\FACSDiva\CST\LJ
  - BD FACSDiva for old PCs with a single hard drive
  - BD FACSDiva for newer PCs with 2 hard drives: C:\ProgramData\BD\FACSDiva\CST\LJ
  - BD FACSSuite: C:\ProgramData\BD\FACSuite\Logs\[Istrument serial number]\Setup\[Instrument configuration]
* To: Select a desired file location. Please note that you cannot navigate to a network drive with the button to the right, but you can copy/paste a network location.
* Files: \*.csv\* (Cytek, FACSSuite) or \*.cst\* (FACSDiva)
* Other:	/COPY:DAT /W:0 /R:0 /NP /TEE
  - For FACSDiva, also add /IM
* Untick all boxes and leave \F and \XD empty
* Untick /R and /W. Tick /MT and select “10”
* Save your script to a location on the hard drive that is accessible to all users (e.g. the D-drive)
You can test the script by clicking “RobyCopy!”
Note that you can now schedule the script by clicking schedule. However, this didn’t work for us and only allows transfer at a set time instead of a transfer after login. So we followed the following steps:

### Schedule the script
Open windows task scheduler as Administrator (Click the windows key, and type “task scheduler”. Right click and select “ run as administrator”.)
*	Create Task
*	Under general: Fill in a name: e.g. “3L3 Copy QC data”
*	Click “ Change User or Group” 
*	Type “Users” under “Enter the object name to select (examples)” and click check Names. If this doesn’t work, you are probably not logged in as an Administrator.
*	In the tab “Triggers”
  * Click “New” 
  * At “Begin the task:”  Select “At logon”
  * Click “OK”
*	In the tab “Actions”
  *	Click “New” 
  *	Click “ Browse” and select the RoboCopy file you made
  *	Click “OK”
*	Click “OK”. You have now scheduled the task
*	To check whether the task is really scheduled, look in the list of active tasks for the task you made. You can now close Windows Task Scheduler.


  



