# 532_individual_assignment

Chartify Simplified is a streamlined dashboard exploring a Spotify song features dataset. Any artist can be selected and filtered by using the search box to view their total streams and likes, alongside a breakdown of their songs' cross-platform popularity across Spotify and YouTube. This can be used by music enthusiast, fan, or even artists and music producers themselves.

The main and stable deployment of this dashboard can be found here: https://019ce455-1d4c-424d-b90e-06727f6efd78.share.connect.posit.cloud

## Quick-Start Setup Instructions
To install the required packages and run the app locally, follow the instructions below:
1. After opening a terminal copy and paste:
```
git clone https://github.com/Diana-Cornescu/532_individual_assignment
```
2. Via file explorer: navigate to the folder cloned
3. Open the `app.R` file located within `scr` folder
4. Double click `app.R` to open in RStudio (Presumes that this is already installed)
5. In the R console, copy and paste:
```
install.packages(c("shiny", "bslib", "ggplot2", "dplyr", "tidyr"))
```
6. After packages are all installed, copy and paste (R console):
```
shiny::runApp("app.R")
```
7. A new Rstudio window should pop up. The dashboard can now be viewed and interacted with locally. 
