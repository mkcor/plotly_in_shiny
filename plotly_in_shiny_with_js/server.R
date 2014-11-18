# Load libraries:
library(shiny) 
library(plotly)

# Get time with millisecond accuracy
#options(digits.secs=6)

shinyServer(function(input, output) {

#   # Set the value for the gauge
#   # When this reactive expression is assigned to an output object, it is
#   # automatically wrapped into an observer (i.e., a reactive endpoint)
#   output$live_plotly <- reactive({
#     running_mean <- mean(last(values(), n = 10))
#     round(running_mean, 1)
#   })
  
  # good  
  py <- plotly(username="pdespouy", 
               key="rl18kwjamr", 
               base.url="https://plot.ly")  # Open Plotly connection
  ggiris <- qplot(x=Petal.Width, y=Sepal.Length, data=iris, color=Species)
  res <- py$ggplotly(ggiris, kwargs=list(filename="Plotly in Shiny with JS", 
                                         fileopt="overwrite", # Overwrite plot in Plotly's website
                                         auto_open=FALSE))
  
#   output$plotly_live <- reactive({
#   })
    
# does it need to go to server.R?
# output$live_plotly <- reactive({
#   input$send  # this input is sent to live_plotly (that is a class taken in dashwidgets.R, and sent to *binding.js)
# })

#     output$live_plotly <- reactiveUI({
# #input$send
# # })
#       tags$iframe(name="receiver",
#                   src=res$response$url,
#                   frameBorder="0",  # Some aesthetics
#                   height=600,
#                   width=1050)
#     })

#     works:
     output$plotly_output <- renderUI({  # with reactive it does not work   
# 
#     #subset_iris <- iris[iris$Species %in% c(input$send, "virginica"), ]  # Subset dataset
#     #ggiris <- qplot(x=Petal.Width, y=Sepal.Length, data=subset_iris, color=Species)
# #     res <- py$ggplotly(ggiris, kwargs=list(filename="Plotly in Shiny with JS", 
# #                                            fileopt="overwrite", # Overwrite plot in Plotly's website
# #                                            auto_open=FALSE))
#         
#     # <iframe src="https://plot.ly/~pdespouy/2228" frameBorder="0" height="600" width="1050"></iframe>
       
       tags$iframe(id="plot",
                src=paste0(res$response$url, ".embed"),
                  frameBorder="0",  # Some aesthetics
                  height=600,
                  width=1050)
   })
})
