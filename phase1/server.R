shinyServer(function(input, output){
  output$plot <- renderPlot({
    input$newplot
    # Add a little noise to the cars data
    cars2 <- cars + rnorm(nrow(cars))
    z <- lm(dist ~ speed, data = cars2)
    plot(cars2)
    abline(z)
    grid(col = "lightgray", lty = "dotted")
  })
})
