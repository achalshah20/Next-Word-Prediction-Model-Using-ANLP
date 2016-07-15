library(shiny)
library(ANLP)

# List of all the models
modelsList = readRDS("output/modelsList.RDS")
isReady <- T

# Define server logic required to generate and plot a random distribution
shinyServer(function(input, output, session) {

  # Expression that generates a plot of the distribution. The expression
  # is wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should be automatically
  #     re-executed when inputs change
  #  2) Its output type is a plot

  observe({

   text <- reactive({input$text})

   predictions <- predict_Backoff(text(),modelsList)
   a1 <<- predictions[1]
   a2 <<- predictions[2]
   a3 <<- predictions[3]

   output$prediction1 <- renderUI({
     actionButton("button1", label = a1)
     #HTML("<button id="prediction1" class="shiny-text-output"></button>")
   })


   output$prediction2 <- renderUI({
     actionButton("button2", label = a2)

   })



   output$prediction3 <- renderUI({
     actionButton("button3", label = a3)

   })




  })

  observeEvent(input$button1, {
    if(input$button1 == 1){
      name <- paste(input$text, a1)
      updateTextInput(session, "text", value=name)
    }

  })

  observeEvent(input$button2, {

    name <- paste(input$text, a2)
    updateTextInput(session, "text", value=name)
  })

  observeEvent(input$button3, {

    name <- paste(input$text, a3)
    updateTextInput(session, "text", value=name)
  })













})
