# load libraries, suppress metadata
suppressPackageStartupMessages(c(
  library(stringr),
  library(stylo),
  library(tm)
))

# include helper functions
source("./predict.R")

# server code
shinyServer(function(input, output) {
  nextWord <- reactive({
    t <- input$text
    tt <- reFreshen(t)
    wCount <- length(tt)
    nextWord <- getNextWord(wCount,tt)
    })
    
  
  next3 <- reactive({
    t <- input$text
    tt <- reFreshen(t)
    wCount <- length(tt)
    next3 <- getNextThree(wCount,tt)
    })

  
  output$inputWords <- renderText({input$text}, quoted = FALSE)
  output$nextWords <- renderPrint(nextWord())
  output$nextThree <- renderPrint(next3())
  
})

