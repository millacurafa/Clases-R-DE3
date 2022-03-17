
library(shiny)
library(dplyr)
library(ggplot2)
library(CodeClanData)

ui <- fluidPage(
  #advanced ui change - made title bold
  titlePanel(tags$b("Five Country Medal Comparison")),

  #advanced ui change - changed to grid layout
  fluidRow(
    column(
      6,
      radioButtons("season",
        #advanced ui change - made button title italic
        tags$i("Summer or Winter Olympics?"),
        choices = c("Summer", "Winter")
      )
    ),
    column(
      6,
      radioButtons("medal",
        #advanced ui change - made button title italic
        tags$i("Compare Which Medals?"),
        choices = c("Gold", "Silver", "Bronze")
      )
    )
  ),

  fluidRow(

    #advanced ui change - added tabs
    tabsetPanel(
      tabPanel(
        "Plot",
        plotOutput("medal_plot")
      ),
      tabPanel(
        "Text",
        "This is some text in a different tab."
      )
    )
  )
)


server <- function(input, output) {
  output$medal_plot <- renderPlot({
    bar_colour <- case_when(
      input$medal == "Gold" ~ "#C9B037",
      input$medal == "Silver" ~ "#B4B4B4",
      input$medal == "Bronze" ~ "#AD8A56"
    )


    olympics_overall_medals %>%
      filter(team %in% c(
        "United States",
        "Soviet Union",
        "Germany",
        "Italy",
        "Great Britain"
      )) %>%
      filter(medal == input$medal) %>%
      filter(season == input$season) %>%
      ggplot() +
      aes(x = team, y = count) +
      geom_col(fill = bar_colour)
  })
}

shinyApp(ui = ui, server = server)

