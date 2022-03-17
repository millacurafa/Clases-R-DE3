#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)
library(CodeClanData)
library(DT)

ui <- fluidPage(

    titlePanel("World Wide Game Sales"),

    sidebarLayout(
        sidebarPanel(
            selectInput("genre", "Genre", unique(game_sales$genre), multiple = TRUE,  selected = "Platform"),
            selectInput("publisher", "Publisher", unique(game_sales$publisher), multiple  = TRUE, selected = "Nintendo"),
            sliderInput("min_year", "Start Year", min(game_sales$year_of_release), max(game_sales$year_of_release), min(game_sales$year_of_release)),
            sliderInput("max_year", "End Year", min(game_sales$year_of_release), max(game_sales$year_of_release), max(game_sales$year_of_release))
        ),

        mainPanel(
           plotOutput("scatter"),
           DT::dataTableOutput("table")
        )
    )
)

server <- function(input, output) {
    
    filter_data <- reactive({
        game_sales %>%
            filter(genre %in% input$genre) %>%
            filter(publisher %in% input$publisher) %>%
            filter(year_of_release >= input$min_year) %>%
            filter(year_of_release <= input$max_year)
    })

    output$scatter <- renderPlot({
      
        ggplot(filter_data()) +
            aes(x = user_score, y = critic_score) +
            geom_point() +
            geom_smooth(method = "lm")
        
    })
    
    output$table <- DT::renderDataTable({
        
        filter_data() %>%
            arrange(desc(sales))
        
    })
}

# Run the application 
shinyApp(ui = ui, server = server)
