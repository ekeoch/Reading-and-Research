source("dbHelper.R")


shinyServer(function(input, output){
  
  saveFile <- function(){
    if(is.null(input$input_file)) return(NULL)
    infile <- input$input_file
    dbData <- read.csv(infile$datapath, header = FALSE)
    names(dbData) <- c("circumference", "diameter")
    saveData(dbData)
  }
  
  
  upload <- reactiveValues(link = 1)
  observeEvent(input$upload, {
    data <- data.frame("circumference" = input$circumference, "diameter" = input$diameter)
    saveData(data)
    upload$link <- upload$link + 1
  })
  
  
  output$plot <- renderPlot({
    upload$link
    
    input$refresh #reload plot on refresh click
    saveFile()
    
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
