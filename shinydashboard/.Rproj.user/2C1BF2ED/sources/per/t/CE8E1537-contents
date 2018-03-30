#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# from <- c("a","b")
# message <- c("c","d")
# 
# messageData <- data.frame(from,message)
# # Define server logic required to draw a histogram
# shinyServer(function(input, output) {
#   output$messageMenu <- renderMenu({
#     # Code to generate each of the messageItems here, in a list. This assumes
#     # that messageData is a data frame with two columns, 'from' and 'message'.
#    
#     msgs <- apply(messageData, 1, function(row) {
#       messageItem(from = row[["from"]], message = row[["message"]])
#     })
#     
#     # This is equivalent to calling:
#     #   dropdownMenu(type="messages", msgs[[1]], msgs[[2]], ...)
#     dropdownMenu(type = "messages", .list = msgs)
#   })
#   
# })
shinyServer(function(input, output) {
  output$menu <- renderMenu({
    sidebarMenu(
      menuItem("Menu item", icon = icon("calendar"))
    )
  })
  
  # Reactive expression to compose a data frame containing all of the values
  sliderValues <- reactive({
    
    # Compose data frame
    data.frame(
      Name = c("Animation"),
      Value = as.character(c(input$animation)), 
      stringsAsFactors=FALSE)
  }) 
  
  # Show the values using an HTML table
  output$values <- renderTable({
    sliderValues()
  })
  
  
  
  output$splom <- renderPlot({
  splom(mtcars[c(1, 3:7)], groups = mtcars$cyl,
        pscales = 0,pch=1:3,col=1:3,
        varnames = c("Miles\nper\ngallon", "Displacement\n(cu. in.)",
                     "Gross\nhorsepower", "Rear\naxle\nratio",
                     "Weight", "1/4 mile\ntime"),
        key = list(columns = 3, title = "Number of Cylinders",
                   text=list(levels(factor(mtcars$cyl))),
                   points=list(pch=1:3,col=1:3)))
})

output$wireframe <- renderPlot({
  wireframe(volcano, shade = TRUE,
            aspect = c(61/87, 0.4),
            light.source = c(10,0,10))
})

output$mychart1 <- renderChart({
  hair_eye_male <- subset(as.data.frame(HairEyeColor), Sex == "Male")
  hair_eye_male[,1] <- paste0("Hair",hair_eye_male[,1])
  hair_eye_male[,2] <- paste0("Eye",hair_eye_male[,2])
  p1 <- nPlot(Freq ~ Hair, group = "Eye", data = hair_eye_male, type = "multiBarChart")
  p1$chart(color = c('brown', 'blue', '#594c26', 'green'))
  ##需要再次指定ui.r处的id
  p1$addParams(dom="mychart1")
  return(p1)
})

output$mychart2 <- renderChart({
  a <- hPlot(Pulse ~ Height, data = MASS::survey, type = "bubble", title = "Zoom demo", subtitle = "bubble chart", size = "Age", group = "Exer")
  a$colors('rgba(223, 83, 83, .5)', 'rgba(119, 152, 191, .5)', 'rgba(60, 179, 113, .5)')
  a$chart(zoomType = "xy")
  a$exporting(enabled = T)
  a$addParams(dom="mychart2")
  return(a)
})

output$mytable <- renderDataTable({
  data<- as.data.frame(HairEyeColor)
  datatable(data)
})

output$networkD3 <- renderForceNetwork({
  
  forceNetwork(Links = MisLinks, Nodes = MisNodes,
               Source = "source", Target = "target",
               Value = "value", NodeID = "name",
               Group = "group", opacity = 0.8,zoom = T)
  
  })

})
