source("dbHelper.R")


shinyServer(function(input, output){
  output$plot <- renderPlot({
    #cars2 <- cars + rnorm(nrow(cars))
    dbData <- loadData()
    z <- lm(circumference ~ diameter , data = dbData)
    plot(dbData$diameter, dbData$circumference,
         xlab = "Diameter (cm)", ylab = "Circumference (cm)", 
         xlim = c(0, input$maxDiameter), ylim = c(0, input$maxCircumference))
    abline(z)
    grid(col = "lightgray", lty = "dotted")
  })
})
