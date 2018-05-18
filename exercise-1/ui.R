# ui.R
#install.packages("shinythemes")
library(shiny)
library(plotly)
library(shinythemes)
shinyUI(navbarPage(theme = shinytheme("sandstone"),
  "Electoral College",
  # Create a tab panel for your map
  tabPanel(
    "Map",
    titlePanel("Electoral College Votes"),
    # Create sidebar layout
    sidebarLayout(

      # Side panel for controls
      sidebarPanel(
        tags$h4("This is a really cool interactive map"),

        # Input to select variable to map
        selectInput(
          "mapvar",
          label = "Variable to Map",
          choices = list(
            "Population" = "population",
            "Electoral Votes" = "votes",
            "Votes / Population" = "ratio"
          )
        )
      ),
      
      # Main panel: display plotly map
      mainPanel(
        plotlyOutput("map"),
        tags$link(rel = "stylesheet", type = "text/css", href = "style.css"),
        tags$div(class = "summary", checked = NA, 
        tags$p("This map shows the electoral college votes by states.
               The darker the color, the higher the number of votes.
               California has the highest votes. This map looks really
               amazing with the added styles.")
        ),
        tags$a(href = "https://www.archives.gov/federal-register/electoral-college/about.html",
               "for more information")
      )
    )
  ),
  tabPanel("other",
           tags$h1("This page is completely empty")
  )

  # Create a tabPanel to show your scatter plot
))