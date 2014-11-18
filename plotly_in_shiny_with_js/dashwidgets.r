# this function is to be ran in server.R; 
plotlyOutput <- function(outputId, width, height) {
  tags$div(id = outputId, class = "plotly_output",  # this class was called 'receiver'
           style = sprintf("width:%dpx; height:%dpx", width, height))
}
