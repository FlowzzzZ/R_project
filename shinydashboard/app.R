#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#



library(shiny)
library(lattice)
library(shinydashboard)
library(rCharts)
library(DT)
library(networkD3)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
  forceNetworkOutput("networkD3")
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
  output$networkD3 <- renderForceNetwork({
    data(MisLinks)
    data(MisNodes)
    forceNetwork(Links = MisLinks, Nodes = MisNodes,
                 Source = "source", Target = "target",
                 Value = "value", NodeID = "name",
                 Group = "group", opacity = 0.8,zoom = T)
  })
}

# Run the application 
shinyApp(ui = ui, server = server)

