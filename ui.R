library(shiny)

shinyUI(
  navbarPage("Analysis of Car Features",
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("Relationship between various car features with respect to miles per gallon (MPG)"),
                        sidebarLayout(
                          sidebarPanel(
                            helpText("Share details of your car usage and expected features of cars"),
                            sliderInput('disp', 'Displacement', min=70, max=480, value=c(70,480), step=10),
                            sliderInput('hp', 'Gross horsepower', min=50, max=340, value=c(50,340), step=10),
                            selectInput("variable", "Variable:",
                                        c("Rear axle ratio" = "drat",
                                          "Weight (lb/1000)" = "wt",
                                          "Number of forward gears" = "gear",
                                          "Number of carburetors" = "carb"
                                        )),
                            checkboxGroupInput('cyl', 'Number of cylinders:', c("Four"=4, "Six"=6, "Eight"=8), selected = c(4,6,8))
                
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("Regression model", 
                                                 plotOutput("mpgPlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             )
  )
)