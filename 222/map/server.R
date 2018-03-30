shinyServer(function(input, output) {
  
  
  ## 创建函数，方法类似于js
  ## 获得输入地址的经纬度，并json化
  getcoord <- function(x){## x 为地址
    x <- fromJSON(getCoordinate(x))
    return(x)
  }
  
  ## 输出 leaflet 数据 到 id为map的前端
  output$map <- renderLeaflet({
    ##输出地图  
    m <- leaflet()
    ##输出组件函数addTiles，将m作为参数传入函数内，使用%>%
    m <- m%>%addTiles()
    
    if(input$selected == '定位'){
      temp <- getcoord(input$Loc)
      ##status为0时成功，1时失败
      if(temp$status!=0){
        output$Request <- renderText({
          c('请输入地点')
        })
        m
      }else{
        output$Request <- renderText({
          c('成功')
        })
        m %>% addMarkers(lng=temp$result$location$lng,
                         lat=temp$result$location$lat,
                         popup = paste0(input$Loc,'--',temp$result$level))
      }
    }else{
      temp1 <- getcoord(input$Start)
      temp2 <- getcoord(input$End)
      if(temp1$status==0&temp2$status==0){
        output$Request <- renderText({
          c('地点错误')
        })
        route <- getRoute(input$Start,input$End)
        m%>%addPolylines(route$lon,route$lat)%>%
          ##遍历标点
          addMarkers(lng=route$lon[c(1,nrow(route))],
                     lat=route$lat[c(1,nrow(route))],
                     ##给标点添加信息
                     popup = c(paste0(input$Start,'--',temp1$result$level),
                               paste0(input$End,'--',temp2$result$level)))
      }else{
        output$Request <- renderText({
          c('地点错误')
        })
      }
    }
  })
})
