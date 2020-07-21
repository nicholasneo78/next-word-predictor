# Load libraries
suppressPackageStartupMessages(c(
  library(stringr),
  library(stylo),
  library(tm)
))

# include all the helper functions
source("./predict.R")

# server code
shinyServer(function(input, output) {
  nextWord <- reactive({
    inputText <- input$text
    processedText <- refresh(inputText)
    wCount <- length(processedText)
    nextWord <- getNextWord(wCount,processedText)
    })
    
  
  next3 <- reactive({
    inputText <- input$text
    processedText <- refresh(inputText)
    wCount <- length(inputText)
    next3 <- getNextThree(wCount,processedText)
    })

  
  output$inputWords <- renderText({input$text}, quoted = FALSE)
  output$nextWords <- renderPrint(nextWord())
  output$nextThree <- renderPrint(next3())
  
})

