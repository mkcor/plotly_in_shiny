# deploy local shiny app to shinyapps.io.
# https://plotly.shinyapps.io/plotly_in_shiny/

# if you have not configure your local machine: 
# http://shiny.rstudio.com/articles/shinyapps.html

library("devtools")
install_github("ropensci/plotly")
library(plotly)

library(shiny)
library(shinyapps)

getwd()
setwd("~/Documents/plotly/pedrodz/plotly_in_shiny")

# run locally
runApp() # or
shiny::runApp('~/Documents/plotly/pedrodz/plotly_in_shiny/')
#shiny::runApp('~/Documents/plotly/pedrodz/plotly_in_shiny/',
#              display.mode = "showcase")

# deploy to remote server (shinyapps.io)
deployApp(appDir=getwd(), appName="plotly_in_shiny", account="plotly")
#showLogs(appName="plotly_in_shiny2", account="plotly")  # show logs
sessionInfo()  # packages installed
#terminateApp("plotly_in_shiny")
