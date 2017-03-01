library(RMySQL)
library(DBI)


options(
  mysql = list(
    "host" = "127.0.0.1",
    "port" = 3306,
    "user" = "root",
    "password" = "@02599881"
  )
)


databaseName = "reading_and_research"
table <- "circumference_v_diameter"


saveData <- function(data) {
  # connect to database
  db <- dbConnect(MySQL(), 
                  dbname = databaseName, 
                  host = options()$mysql$host,
                  port = options()$mysql$port,
                  user = options()$mysql$user,
                  password = options()$mysql$password)
  
  dbWriteTable(db, value = data, name = table, append = TRUE, row.names = FALSE)
  dbDisconnect(db)
}


loadData <- function() {
  # connect to the database
  db <- dbConnect(MySQL(), 
                  dbname = databaseName, 
                  host = options()$mysql$host,
                  port = options()$mysql$port,
                  user = options()$mysql$user,
                  password = options()$mysql$password)
  
  # construct the fecthing query
  query <- sprintf("select circumference, diameter from %s", table)
  
  # submit the fetch query and disconnect
  data <- dbGetQuery(db, query)
  dbDisconnect(db)
  data
}


