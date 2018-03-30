##导入相关的Package
##
options(baidumap.key = 'pzsxVTAgQsSAXfolToTgqpdUebRTgZib')


library(shiny)
library(leaflet)
library(baidumap)
library(rjson)

shinyUI(fluidPage(
  
  ##标题
  
  
  ## 绘制leaflet
  leafletOutput(outputId = 'map',width="1920px",height = '1080px'),
  
  ## 页面组件
  
  ##创建一个绝对定位的panel
  absolutePanel(width = 430,top=200,left = 'auto',draggable = T,
                textInput(inputId = 'Loc',label = '地点'),
                textInput(inputId = 'Start',label = '出发地',width = "50%"),
                textInput(inputId = 'End',label = '目的地',width = "50%"),
                selectInput(inputId = 'selected',label = '路线 or 定位',
                            choices = c('定位','路线'),selected = '定位',
                            multiple = F),
                textOutput(outputId = 'Request'),
                submitButton(text = "Submit")
  )
))