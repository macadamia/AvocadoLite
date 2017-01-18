
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(plotly)
library(RColorBrewer)

shinyServer(function(input, output,session) {

  output$topoPlot <- renderPlotly({
    if(input$when == 'Before Prune'){
      fileN <- paste('Avo_',input$treeNum,'_beforepruning_Complete.csv',sep='')
    } else {
      fileN <- paste('Avo_',input$treeNum,'_pruned_Complete.csv',sep='')
    }
    csv1 <- read.csv(fileN,header = T)
    csv1$FL <- as.character(csv1$FL)
    theLeaves <- data.frame(csv1)

    f1 <- list(
      family = "Arial, sans-serif",
      size = 18,
      color = "black")

    f2 <- list(
      family = "Old Standard TT, serif",
      size = 14,
      color = "blue")

    axisX <- list(
      titlefont = f1,
      tickfont = f2,
      showgrid = T,
      title='Z'
    )

    axisY <- list(
      titlefont = f1,
      tickfont = f2,
      showgrid = T,
      title='X'
    )

    axisZ <- list(
      titlefont = f1,
      tickfont = f2,
      showgrid = F,
      title='Y'
    )

    scene = list(
      xaxis = axisX,
      yaxis = axisY,
      zaxis = axisZ,
      aspectratio = list(x = 1, y = 1, z = 1)

    )

    cols <- brewer.pal(nlevels(theLeaves$FL), "Paired")

    p <- plot_ly(theLeaves, x=-X, y=-Z, z=Y,type='scatter3d',mode = "markers",
            marker = list(opacity = 0.6, size = 3), color=FL,colors=cols)
    layout(p,scene = scene)
  })


})
