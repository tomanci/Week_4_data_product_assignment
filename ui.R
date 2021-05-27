
library(shiny)
library(caret)
library(plotly)
library(dplyr)

# Define UI for application that draws a histogram
shinyUI(fluidPage(

    # Application title
    titlePanel("MPG prediction given all the others information"),
    
    # Sidebar with a slider input for number of bins
    sidebarLayout(
        sidebarPanel(
            h3("Here you can change all the parameters in order to predict how much MPG ( miles per gallon) your veichle will do!"),
            sliderInput("sliderCYL","Number cylinders:",min = 2, max = 14, value = 4),
            sliderInput("sliderDISP","Displacement (inch):",min = 50, max = 500, value = 200),
            sliderInput("sliderHP","Number of break Horsepower:",min = 50, max = 800, value = 150),
            sliderInput("sliderDRAT","Rear axle ratio:",min = 2.50, max = 7, value = 3.254),
            sliderInput("sliderWT","Weight of the car(1000 lbs):",min = 1, max = 10, value = 3.516),
            sliderInput("sliderQSEC","1/4 mile time:",min = 10.00, max = 30.00, value = 19.512),
            checkboxInput("showENGINE","Show=Straitght Engine/Hide= v-shape engine",value=T),
            checkboxInput("showTRANS","Show=manual transmission/Hide= automatic transmission",value=T),
            sliderInput("sliderGEAR","Number of foward gears:",min = 4, max = 10, value = 6),
            sliderInput("sliderCARB","Number of carburators:",min = 2, max = 10, value = 6),
            submitButton("Submit")
        ),

        # Show a plot of the generated distribution
        mainPanel(
            h1("Here there is the plot which link some carateristics of the vehicles."),
            plotlyOutput("PlotMPG"),
            h1("The prediction of the total miles that your vehicles will do with a gallon is:
               
               "),
            h3(textOutput("modelpred"))
        )
    )
))
