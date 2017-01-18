
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(plotly)
library(RColorBrewer)

shinyUI(fluidPage(

  # Application title
  titlePanel("Avocado Light Modelling"),


  sidebarLayout(
    sidebarPanel(
      selectInput("treeNum", "Tree",
                  choices = list('6.6.3','6.7.3')),
      selectInput("when", label = h3("Timing"),
                 choices = list("Before Prune" , "After Prune" ))
    ),

    mainPanel(
      plotlyOutput("topoPlot",height = "800px")
    )
  )
))
