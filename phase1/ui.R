shinyUI(fluidPage(
  
  tags$head(
    tags$style(
      HTML("
          
      "
      )
    )
  ),
  
  titlePanel("Reading and Research: Central Data Pooling and Processing Service."),
  br(),
  br(),
  sidebarLayout(
    sidebarPanel(
      strong("Data Input:"),
      br(),
      br(),
      numericInput("circumference", label = "Circumference (m): ", value = 0.0),
      br(),
      numericInput("diameter", label = "Diameter (m): ", value = 0.0),
      submitButton("upload"),
      br(),
      br(),
      
      
      fileInput("input_file", label = "File Upload:")
      
      
    ),
    
    mainPanel(

    )
  )
))
