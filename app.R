# install.packages(c("shiny", "bslib", "ggplot2", "dplyr", "tidyr"))
# shiny::runApp("app.R")

library(shiny)
library(bslib)
library(ggplot2)
library(dplyr)
library(tidyr)


df <- read.csv("data/spotify_clean.csv", stringsAsFactors = FALSE)


artists <- sort(unique(df$Artist))

ui <- fluidPage(

  h1("Individual Assignment: 'Chartify Simplified' in R"),

  selectizeInput(
    inputId  = "artist",
    label    = "Select Artist to Filter by:",
    choices  = artists,
    selected = "Beyonce", #adding a default to showcase use
    options  = list(placeholder = "Type & select an artist name...",
                    allowEmptyOption = TRUE)
  ),
)

server <- function(input, output, session) {}

shinyApp(ui, server)