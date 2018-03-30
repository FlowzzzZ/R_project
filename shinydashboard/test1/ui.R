#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
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

# dashboardPage(
#   dashboardHeader(title = "我的第一个Dashborad",
#                   dropdownMenuOutput("messageMenu"),
#                   dropdownMenu(type = "messages",
#                                messageItem(
#                                  from = "Sales Dept",
#                                  message = "Sales are steady this month."
#                                ),
#                                messageItem(
#                                  from = "New User",
#                                  message = "How do I register?",
#                                  icon = icon("question"),
#                                  time = "13:45"
#                                ),
#                                messageItem(
#                                  from = "Support",
#                                  message = "The new server is ready.",
#                                  icon = icon("life-ring"),
#                                  time = "2014-12-01"
#                                )
# 
#                   ),
#                   dropdownMenu(type = "notifications",
#                                notificationItem(
#                                  text = "5 new users today",
#                                  icon("users")
#                                ),
#                                notificationItem(
#                                  text = "12 items delivered",
#                                  icon("truck"),
#                                  status = "success"
#                                ),
#                                notificationItem(
#                                  text = "Server load at 86%",
#                                  icon = icon("exclamation-triangle"),
#                                  status = "warning"
#                                )
#                   ),
#                   dropdownMenu(type = "tasks", badgeStatus = "success",
#                                taskItem(value = 90, color = "green",
#                                         "Documentation"
#                                ),
#                                taskItem(value = 17, color = "aqua",
#                                         "Project X"
#                                ),
#                                taskItem(value = 75, color = "yellow",
#                                         "Server deployment"
#                                ),
#                                taskItem(value = 80, color = "red",
#                                         "Overall project"
#                                )
#                   )
#   ),
#                   
#   
#   dashboardSidebar(),
#   
#   dashboardBody()
# )

##################################################################################################################################

## ui.R ##
# sidebar <- dashboardSidebar(
#   sidebarMenu(
#     sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
#                       label = "Search..."),
#     menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
#     menuItem("Widgets", icon = icon("th"), tabName = "widgets",
#              badgeLabel = "new", badgeColor = "green")
#     
#   )
# )
# 
# body <- dashboardBody(
#   tabItems(
#     tabItem(tabName = "dashboard",
#             h2("Dashboard tab content")
#     ),
#     
#     tabItem(tabName = "widgets",
#             h2("Widgets tab content")
#     )
#   )
# )
# 
# # Put them together into a dashboardPage
# dashboardPage(
#   dashboardHeader(title = "Simple tabs"),
#   sidebar,
#   body
# )



##################################################################################################################################



sidebar <- dashboardSidebar(
  sidebarMenu(
    sidebarSearchForm(textId = "searchText", buttonId = "searchButton",
                      label = "Search..."),
    sidebarMenuOutput("menu"),
    
    # Animation with custom interval (in ms) to control speed, plus looping
    sliderInput("animation", "Looping Animation:", 1, 2000, 1, step = 10, 
                animate=animationOptions(interval=300, loop=T)),
    menuItem("首页", icon = icon("dashboard"),startExpanded = TRUE,
             menuSubItem("Sub-item 1", tabName = "homePage"),
             menuSubItem("Sub-item 2", tabName = "subitem2")
             ),
    menuItem("可视化展示1", tabName = "showpic1", icon = icon("dashboard")),
    menuItem("可视化展示2", icon = icon("dashboard"), tabName = "showpic2"),
    menuItem("可视化展示3", icon = icon("dashboard"), tabName = "showpic3"),
    menuItem("可视化展示4", icon = icon("dashboard"), tabName = "showpic4"),
    menuItem("可视化展示5", icon = icon("dashboard"), tabName = "showpic5"),
    menuItem("可视化展示6", icon = icon("dashboard"), tabName = "showpic6")

  )
)

body <- dashboardBody(
  
 
  
  tabItems(
    tabItem(tabName = "homePage",
            h2("HomePage"),
            tableOutput("values")
    ),  
    
    tabItem(tabName = "showpic1",
              h2("Dashboard pic1"),
              plotOutput("splom")
      ),

      tabItem(tabName = "showpic2",
              h2("Dashboard pic2"),
              plotOutput("wireframe")
      ),
      ####与forceNetworkOutput("networkD3") 有冲突#############################################
      tabItem(tabName = "showpic3",
              h2("Dashboard pic3"),
              ##需要在showoutput下指明类型，如nvd3
              showOutput("mychart1","nvd3")
      ),
      tabItem(tabName = "showpic4", 
              ##需要在showoutput下指明类型，如nvd3
              showOutput("mychart2","highcharts")
      ),
      tabItem(tabName = "showpic5",
              h2("Dashboard pic5"),
              dataTableOutput("mytable")
      ),
      tabItem(tabName = "showpic6",
              h2("Dashboard pic6"),
              forceNetworkOutput("networkD3")
              
      )
    )

  
  )
dashboardPage(
  skin = "black",
  dashboardHeader( title = "数据可视化"
  ),
  sidebar,
  body
)