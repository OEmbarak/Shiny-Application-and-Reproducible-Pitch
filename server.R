
library(car)
library(shiny)

shinyServer(function(input, output) {
    
    #Calculate the amount and interest
    values <- reactiveValues()
    observe({
        input$Calc
        values$insurance <- isolate({
            (input$Amount / input$Years)  * input$Period *
                recode(input$Type, "1 = '0.08'; 2 = '0.05';
                   3 = '0.02'")  })
    })

    
    # Display values entered
    output$AmountVal <- renderText({
        input$Calc
        paste("Car Market amount: [$]", isolate( input$Amount))
    })
    
    output$YearsVal <- renderText({
        input$Calc
        paste("Year Since Manufacturing: ", isolate(input$Years))
    })
    
    output$PeriodVal <- renderText({
        input$Calc
        paste("Duration: ", isolate(input$Period))
    })
    
    output$TypeVal <- renderText({
        input$Calc
        paste("Insurance Type", isolate(input$Type),
              recode(isolate(input$Type),
                     "1 = 'Full'; 2 = 'Half';3 = 'Aginest Others'"))
    })
    
    
    
    
    # Display calculated values
    output$CalcInsurance <- renderText({
        if(input$Calc == 0) ""
        else
            paste("Insurance Value is [$]:", round( values$insurance,digits = 2 ))
    })
    
})
