library(shiny)
library(car)

shinyUI(fluidPage(
    titlePanel("Car Inusrance Calculator - Ossama Embarak, UAE Agust 2 2020"),
    sidebarLayout(
        sidebarPanel(
            helpText(" This is a car insurance system that calculate the insurance value based on number of years and the car valuen inputs."),            
            br(),            
            numericInput("Amount",
                         label = h6("Enter your car market price"),
                         value = 10000),
            br(),            
            sliderInput("Years",
                        label = h6("Enter the numer of years since manufacturing"),
                        min = 0, max = 25, value = 7),
            
            br(),            
            sliderInput("Period",
                        label = h6("Select insurance perios (Months)"),
                        min = 6, max = 24, value = 6),
            selectInput("Type",
                        label = h6( "Insurance Type"),
                        choices = list("Full" = 1,
                                       "Half" = 2,
                                       "Aginest Others" =3),
                        selected = 1 
            ), 
            br(),
            br(),    
            
            actionButton("Calc", label = "Calculate!")        
        ),
        mainPanel(
            tabsetPanel(
                tabPanel("Output",
                         p(h5("Values you entered:")),
                         textOutput("AmountVal"),
                         textOutput("YearsVal"),
                         textOutput("PeriodVal"),
                         textOutput("TypeVal"),
                         br(),
                         
                         p(h5("Calculated amount:")),
                         textOutput("CalcInsurance")
                         
                ),
                tabPanel("Documentation",
                         p(h4("Insurance Calculator:")),
                         br(),
                         helpText("The following formula is used to culate the insurance value "),
                         HTML("<u><b> Equation : </b></u>
                        <br> <br>
                        <b> Insurance Value = Amount/Years * Period * Type</b>
                        <br>
                        where: <br>
                        Amount = The car market price <br>
                        Years = Years since manufacturing <br>
                        Period = The insurance period in mon ths <br>
                        Type = The insurance type <br>
                    ")                
                )
            )
        )
    )
))