source("dbHelper.R")


shinyServer(function(input, output){
  
  output$plot <- renderPlot({
    dbData <- loadData()
    z <- lm(circumference ~ diameter , data = dbData)
    plot(dbData$diameter, dbData$circumference,
         xlab = "Diameter (cm)", ylab = "Circumference (cm)", 
         xlim = c(0, input$maxDiameter), ylim = c(0, input$maxCircumference))
    abline(z)
    grid(col = "lightgray", lty = "dotted")
    output$summary <- renderTable(
      data.frame(c("Slope(Pi): ", "Intercept: ", "Standard Deviation: ", "Input Count"),
                 c(coef(z)[2], coef(z)[1], NaN, nrow(dbData))),
      colnames = FALSE,
      width = "300px",
      digits = 4
    )
  })
})
