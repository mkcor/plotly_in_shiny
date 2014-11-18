library(shiny) 
options(shiny.trace=TRUE)

shinyUI(
  fluidPage(
    
    titlePanel(title="Plotly in Shiny with JS"),

    sidebarLayout(
      sidebarPanel(
# nah working:
       
       textInput("inputtext", label = h3("Change colour"), value = "blue"),
       actionButton(inputId="sendbuttom", label="Change colour"),
#         checkboxGroupInput(inputId="send",  # ID to be used in server.R
#                            label="Select species:",
#                            choices=list("Setosa"="setosa"),
#                            selected=list("setosa")),
      width=2),
    
    mainPanel(
      # For the Shiny output binding for... Plotly
      tags$head(tags$script(src = 'plotly_binding.js')),
      tags$head(tags$script(src = 'js/jquery-1.11.1.min.js')),
      # This should be the output: 
      #plotlyOutput(id="live_plotly", width=250, height=200),
      #tags$div(id="live_plotly", class="plotly_output",  # this class was called 'receiver'
      #         style="min-width: 200px; height: 230px;"),
      #verbatimTextOutput("live_plotly")
      htmlOutput(outputId="plotly_output")
      )
    )
  )
)
