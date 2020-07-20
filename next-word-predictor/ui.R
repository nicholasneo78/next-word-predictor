# Load required library
suppressPackageStartupMessages(c(library(shinythemes),library(shiny)))

# App title and browser tab title
appTitle = (div(HTML("<h1><strong>Next Word Predictor</strong></h1>")))
browserText = "Next Word Predictor"

# create tabs and panels
shinyUI(fluidPage(titlePanel(appTitle,browserText),
                  
                  hr(),
                  theme = shinytheme("cosmo"),
                  navbarPage("An NLP Project",id ="navpanel",
                             
                             # Home tab is panel with a sidebar and main sections  
                             tabPanel("App",
                                      sidebarLayout(
                                        
                                        #sidebar - Instructions 
                                        sidebarPanel(id="sidebarPanel",
                                                     includeHTML("./components/instructions.html"),
                                                     width = 2
                                                     
                                        ), 
                                        
                                        # mainpanel - text prediction app
                                        mainPanel(id="mainpanel",
                                                  tags$div(textInput("text", 
                                                                     label = h3("Insert incomplete sentence here:"),
                                                                     value = "",
                                                                     width = '800px',
                                                                     placeholder = "E.g. the quick brown fox jumps over the lazy"),
                                                           br(),
                                                           tags$hr(),
                                                           
                                                           h3("You keyed in:"),
                                                           tags$span(style="color:green",
                                                                     tags$h3(textOutput("inputWords"))),
                                                           br(),
                                                           tags$hr(),
                                                           
                                                           h3("Top predicted word:"),
                                                           tags$span(style="color:red",
                                                                     tags$h3(textOutput("nextWords"))),
                                                           
                                                           br(),
                                                           tags$hr(),
                                                           
                                                           h3("Next 3 predicted word:"),
                                                           tags$span(style="color:gray",
                                                                     tags$h3(textOutput("nextThree"))),
                                                           
                                                           align="center"))
                                      )
                             ),
                             
                      
                             # Briefly describe what this project is about
                             tabPanel("Brief Description", includeHTML("./components/descriptions.html")),
                             
                             # Reference
                             tabPanel("References", includeHTML("./components/references.html")),
                             
                             # About
                             tabPanel("About the Developer", includeHTML("./components/about.html")),
                             
                             tags$hr()
                  )))

