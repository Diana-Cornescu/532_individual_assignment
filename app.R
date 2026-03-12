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
  layout_columns(
    card(
      card_header("Total Likes"),
      h3(textOutput("total_likes"))
    ),
    card(
      card_header("Total Streams"),
      h3(textOutput("total_streams"))
    ),
    col_widths = c(6, 6)
  ),
)

server <- function(input, output, session) {

  filtered <- reactive({
    artist <- trimws(input$artist) #suggestion by claude to handel whitespace
    if (nchar(artist) > 0) {
      df[tolower(df$Artist) == tolower(artist),] #normalizing cases
    } else {df}
  })

  output$total_likes <- renderText({
    format(sum(filtered()$Likes, na.rm = TRUE),  #rm NA to reduce errors
          big.mark = ",")
  })
  
  output$total_streams <- renderText({
    format(sum(filtered()$Stream, na.rm = TRUE), 
          big.mark = ",") #formatting
  })


}

shinyApp(ui, server)