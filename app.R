# Assignment 5 two-tap shiny application 

#Load libraries
library("shiny")
library("dplyr")
library("tidyverse")
library("ggplot2")
library("plotly")
#library("rsconnect")

setAccountInfo(name='jsung1014',
                token='B2921CEDDA3DA8D5EDBAA6CA4518CCAA',
                secret='R7KTfaQI8Nu9Xa5XcgjWeUme5At92BQ6/mwEf8Sv')
deployApp('/USERS/jsung/Documents/info201/assignments/a5-jsung1014')

# Use source() to excute the "app_ui.R" and "app_server.R" files. These will
# define the UI value and server function respectively.
source("app_ui.R")
source("app_server.R")

# Create a new "shinyApp()" using the loaded "ui" and "server" variables
shinyApp(ui = ui, server = server)