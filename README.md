# Next Word Predictor

**_A capstone project done for the Coursera Johns Hopkins Data Science Specialistion_**
  
## Overview
**Goal of this project**   
- To build a Natural Language Processing (NLP) model that takes in an input from the user, which can be **a word**, **a phrase** or an **incomplete sentence**.  
  
**What does it do?**
- The algorithm will use the inputs given and **predict** what the **next top matching word** should be based on the model that its being trained on.   
- The algorithm will also predict the **next 3 best alternative words** that should come **after the input** from the user.   
- Users can start entering an input in the message box and wait for ~3-5 seconds to see its effect!  
  
**Training Data**    
- Corpora from SwiftKey.  
- Consist of text crawled from twitter, blogs and news in 4 languages (US, DE, FI and RU).  
- As a starter, we will only build our model with the English dataset.   
   
**Algorithm**   
- Katz’s back-off Model.  
- An n-gram language model that estimates the conditional probabilty of a word given its history in the n-gram.  
- In the app’s context, we adopted a quad-gram (4 words) language model and use it to predict the last 3 words that the user have input.   
- If there are less than 3 words, then it will based enitrely on what the user have input.   
    
**Brief Project Pipeline**   
- Web Scraping to create the raw datasets (already done by SwiftKey).   
- Process the raw datasets by cleaning the dataset.   
- Do exploratory data analysis to get insights from the datasets.   
- Do ngram analysis and determine which combination of words happen more frequently than the other combinations.   
- Apply Katz’s back-off algorithm to build the model.   
- Set up the web application using Shiny.  
- Deploy the application on shinyapps.io.   

## Software Used
**Code**  
- R: Version 3.6.1  
- RStudio: Version 1.1.456   
- Shiny  

**Deployment**  
- shinyapps.io  

## Files
**SlideDeck.Rmd**   
- The slides to pitch the idea of Next Word Predictor.  

**./next-word-predictor/app.R**   
- Entry point of the app.  

**./next-word-predictor/predict.R**  
- Helper function for server.R.  

**./next-word-predictor/ui.R**  
- User interface of the webapp.  

**./next-word-predictor/server.R**  
- The logic that make the webapp work.  

**./next-word-predictor/components/EDA.Rmd**  
- Basic Exploratory Data Analysis before starting on the webapp.  

**./next-word-predictor/components/about.html**  
- Description of the "About the Developer" tab in the webapp.  

**./next-word-predictor/components/descriptions.html**  
- Description of the "Brief Description" tab in the webapp.  

**./next-word-predictor/components/instructions.html**  
- Description of the side tab in the webapp.  

**./next-word-predictor/components/references.html**  
- Description of the "References" tab in the webapp.  

## Webapp and Pitching Slide
[Next Word Predictor App](https://thatnicneo.shinyapps.io/next-word-predictor/)  
[Slide Deck](https://rpubs.com/thatnicneo/NextWordPredictor)
