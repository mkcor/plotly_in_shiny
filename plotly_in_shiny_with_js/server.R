# Load libraries:
library(shiny) 
library(plotly)

shinyServer(function(input, output) {
  
  py <- plotly(username="pdespouy", 
               key="rl18kwjamr", 
               base.url="https://plot.ly")  # Open Plotly connection
  ggiris <- qplot(x=Petal.Width, y=Sepal.Length, data=iris, color=Species)
  res <- py$ggplotly(ggiris, kwargs=list(filename="Plotly in Shiny with JS", 
                                         fileopt="overwrite", # Overwrite plot in Plotly's website
                                         auto_open=FALSE))
  
  output$plotly_output <- renderUI({  # with reactive it does not work   
    tags$iframe(id="plot",
                src=paste0(res$response$url, ".embed"),
                frameBorder="0",  # Some aesthetics
                height=600,
                width=1050)
   })

})
