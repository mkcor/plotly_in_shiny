library(shiny) 
options(shiny.trace=TRUE)

shinyUI(
  fluidPage(
    
    titlePanel(title="Plotly in Shiny with JS"),

    sidebarLayout(
      sidebarPanel(
        textInput("inputtext", label = h3("Change colour"), value = "blue"),
        actionButton(inputId="sendbuttom", label="Change colour"),
        width=2),
    
    mainPanel(
      # For the Shiny output binding for... Plotly
      tags$head(tags$script(src = 'plotly_binding.js')),
      tags$head(tags$script(src = 'js/jquery-1.11.1.min.js')),
      htmlOutput(outputId="plotly_output")
      )
    )
  )
)
