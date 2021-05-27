
library(shiny)
library(caret)
library(plotly)
library(dplyr)

#fit_mod <- glm(mpg ~.,data=mtcars,family="poisson")

shinyServer(function(input, output,session) {

    output$PlotMPG <- renderPlotly({
        plot_ly(data=mtcars,x=~mpg,y=~hp,z=~disp,mode="lines+markers",color=~as.factor(cyl),type="scatter3d",size=~wt)

         })

    fit_mod <- glm(mpg ~.,data=mtcars,family="poisson")    
    
    modpred <- reactive({
    cyl <- input$sliderCYL
    disp <- input$sliderDISP
    hp <- input$sliderHP
    drat <- input$sliderDRAT
    wt <- input$sliderWT
    qsec <- input$sliderQSEC
    gear <- input$sliderGEAR
    carb <- input$sliderCARB
    vs <- ifelse(input$showENGINE,1,0)
    am <- ifelse(input$showTRANS,1,0)
    new_data <- as.data.frame(t(c("cyl"=cyl,"disp"=disp,"hp"=hp,"drat"=drat,"wt"=wt,"qsec"=qsec,"vs"=vs,"am"=am,"gear"=gear,"carb"=carb)))
        predict(fit_mod,newdata = new_data)
    })
    
    
    output$modelpred <- renderText({
        modpred()
    })
    
    
    
})








