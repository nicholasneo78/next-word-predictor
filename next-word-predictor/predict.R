#
# Coursera Data Science Capstone - Final Project
# E.Manton, March 25, 2018
#

# read in the ngram (bi, tri, quad) tables
quadgram <- readRDS(file = "./ngrams/quadgram.RData")
trigram <- readRDS(file = "./ngrams/trigram.RData")
bigram <- readRDS(file = "./ngrams/bigram.RData")

#helper function - cleanse input text
cleanse<-function(t){
  tt <- tolower(t)
  tt <- removePunctuation(tt)
  tt <- removeNumbers(tt)
  tt <- str_replace_all(tt, "[^[:alnum:]]", " ") # use regex here
  tt <- stripWhitespace(tt)
  return(tt)
}

# helper function - freshen input by calling cleanse
reFreshen <- function(t){
  tt <- cleanse(t)
  tt <- txt.to.words.ext(tt,preserve.case = TRUE)
  return(tt)
}

# prediction function
getNextWord <- function(wCount,userInput){
  # if user enters more than three words, use only the last three words entered
  if (wCount >= 3) {
    userInput <- userInput[(wCount-2):wCount] 
  # if user enters two words, make first word in vector NA 
  } else if (wCount == 2) {
    userInput <- c(NA,userInput)   
  # if user enters one word, make first two in vector NA
  } else if (wCount == 1) {
    userInput <- c(NA,NA,userInput)
  }
  
  nextWords <- as.character(quadgram[quadgram$unigram==userInput[1] & 
                                       quadgram$bigram==userInput[2] & 
                                       quadgram$trigram==userInput[3],][1,]$quadgram)
   
  if(is.na(nextWords)) {
    nextWords <- as.character(trigram[trigram$unigram==userInput[2] & trigram$bigram==userInput[3],][1,]$trigram) 
    
     if(is.na(nextWords)) {
       nextWords <- as.character(bigram[bigram$unigram==userInput[3],][1,]$bigram)
     }
  }
  
  cat(nextWords)
}

getNextThree <- function(wCount,userInput){
  # if user enters more than three words, use only the last three words entered
  if (wCount >= 3) {
    userInput <- userInput[(wCount-2):wCount] 
    # if user enters two words, make first word in vector NA 
  } else if (wCount == 2) {
    userInput <- c(NA,userInput)   
    # if user enters one word, make first two in vector NA
  } else if (wCount == 1) {
    userInput <- c(NA,NA,userInput)
  }
  
  # intialise empty vector of length 3 to contain the next 3 predictions
  nextThree <- vector("character",3)
  
  # for loop to iterate and retreive the next 3 words
  for(i in 2:4){
    nextWords <- as.character(quadgram[quadgram$unigram==userInput[1] & 
                                         quadgram$bigram==userInput[2] & 
                                         quadgram$trigram==userInput[3],][i,]$quadgram)
    
    if(is.na(nextWords)) {
      nextWords <- as.character(trigram[trigram$unigram==userInput[2] & trigram$bigram==userInput[3],][i,]$trigram) 
      
      if(is.na(nextWords)) {
        nextWords <- as.character(bigram[bigram$unigram==userInput[3],][i,]$bigram)
      }
    }
    nextThree <- c(nextThree, nextWords)
    if (i != 4) nextThree <- c(nextThree, ", ")
  }
  cat(nextThree)
}