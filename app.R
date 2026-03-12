
library(shiny)
library(bslib)
library(ggplot2)
library(dplyr)
library(tidyr)


df <- read.csv("data/spotify_clean.csv", stringsAsFactors = FALSE)

ui <- fluidPage()

server <- function(input, output, session) {}

shinyApp(ui, server)