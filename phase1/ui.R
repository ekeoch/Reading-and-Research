shinyUI(fluidPage(
  
  tags$head(
    tags$style(
      HTML("
        .footer {
          postion: absolute;
          right: 0;
          bottom: 0;
          left: 0;
          padding: 1rem;
          background-color: #efefef;
          text-align: center;
        }

        h2 {
          text-align: center;
        }

        #header {
          right: 0;
          top: 0;
          left: 0;
          padding: 1rem;
          background-color: #efefef;
        }
      "
      )
    )
  ),
  HTML("
    <div id='header'><h2>Reading and Research: Central Data Pooling and Processing Service.</h2></div>
  "),

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
      plotOutput("plot", width = "100%", height = "500px"),
      #abline(),
      sliderInput("maxCircumference", "Max Circumference", min = 0, max = 3, value = 1),
      sliderInput("maxDiameter", "Max Diameter", min = 0, max = 3, value = .5)
    )
  ),
  HTML("
      <div class='footer'>This footer will always be positioned at the bottom , but not fixed.</div>
    "
  )
))
