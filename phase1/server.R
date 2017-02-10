
shinyServer(function(input, output){
  output$plot <- renderPlot({
    cars2 <- cars + rnorm(nrow(cars))
    z <- lm(dist ~ speed, data = cars2)
    plot(cars2, xlim = c(0, input$maxDiameter), ylim = c(0, input$maxCircumference))
    abline(z)
    grid(col = "lightgray", lty = "dotted")
  })
})
