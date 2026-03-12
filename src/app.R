# install.packages(c("shiny", "bslib", "ggplot2", "dplyr", "tidyr"))
# shiny::runApp("app.R")

library(shiny)
library(bslib)
library(ggplot2)
library(dplyr)
library(tidyr)
# install.packages("rsconnect")

# setwd("C:/Users/School/OneDrive - UBC/git_folder/532/532_individual_assignment/src")
# rsconnect::writeManifest(appDir = ".", appPrimaryDoc = "app.R")


df <- read.csv("../data/spotify_clean.csv", stringsAsFactors = FALSE)


artists <- sort(unique(df$Artist))
platforms <- c("Spotify", "Youtube")


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
      h3(textOutput("total_likes"))),
    card(
      card_header("Total Streams"),
      h3(textOutput("total_streams"))),
    col_widths = c(6, 6)
  ),
  layout_columns(
    card(
      card_header("Songs by Platform"),
      plotOutput("bar_plot"))
  )
)

server <- function(input, output, session) {
  # REACTIVE CAL DF ============================================
  filtered <- reactive({
    artist <- trimws(input$artist) #suggestion by Claude to handle whitespace
    if (nchar(artist) > 0) {
      df[tolower(df$Artist) == tolower(artist),] #normalizing cases
    } else {df}
  })

  # VALUE CARD 1  ============================================
  output$total_likes <- renderText({
    format(sum(filtered()$Likes, na.rm = TRUE),  #rm NA to reduce errors
          big.mark = ",")
  })
  # VALUE CARD 2  ============================================
  output$total_streams <- renderText({
    format(sum(filtered()$Stream, na.rm = TRUE), 
          big.mark = ",") #formatting
  })
  # BAR PLOT  ============================================
  output$bar_plot <- renderPlot({
    data <- filtered()

    counts <- data |>
      mutate(most_playedon = ifelse(is.na(most_playedon), "Unknown", most_playedon)) |>
      filter(most_playedon %in% platforms) |>
      count(most_playedon) |>
      complete(most_playedon = platforms, fill = list(n = 0))

    ggplot(counts, aes(x = most_playedon, y = n, fill = most_playedon)) +
      geom_col(width = 0.45) +
      geom_text(aes(label = format(n, big.mark = ",")),
                vjust = -0.5, 
                fontface = "bold", 
                size = 4.5) +
      scale_fill_manual(values = c("Spotify" = "darkgreen", 
                                  "Youtube" = "darkred")) +
      scale_y_continuous(expand = expansion(mult = c(0, 0.12)),
                         labels = function(x) format(x, big.mark = ",")) +
      labs(title = paste("Songs by Platform:", trimws(input$artist)),
            x = "Platform", 
            y = "Number of Songs") +
      theme_minimal()
  })
}

shinyApp(ui, server)