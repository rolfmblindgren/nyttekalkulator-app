
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
source("helper.R")

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Nyttekalkulator"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      
        selectInput(inputId = "stillingstype", 
                  label = "Hva slags type stilling er det?", 
                    choices = c("Funksjonær","Fagspesialist","Mellomleder",
                        "Toppleder","Aksjemegler"), 
                  selected = "Funksjonær", 
                  multiple = FALSE, 
                  selectize = TRUE),
    
        numericInput(inputId = "søkere", 
                   label = "Hvor mange søkere er det?",
                   value=1, min = 1, max = NA, step = NA),
      
        numericInput(inputId = "stillinger", 
                   label = "Hvor mange ledige stillinger er det?",
                   value=1, min = 1, max = NA, step = NA),
      
        selectInput("validitet", 
                    label = "Hvilken metode er brukt?", 
                    choices =
                        sort(
                            c("Assessment Center","Arbeidsprøver",
                              "Evnetester","Personlighetstester",
                              "Strukturert intervju",
                              "CV-sjekk",
                              "Referanser",
                              "Ustrukturert intervju",
                              "Astrologi",
                              "Grafologi")), 
                    multiple = FALSE, 
                    selectize = TRUE),
      
      numericInput(inputId = "årslønn", 
                   label = "Hva er årslønna?",
                   value=300000, min = NA, max = NA, step = NA)
      
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(
      htmlOutput("value")
    )
  )
))
