# Assignment 5 two-tap shiny application 

#Load libraries
library("shiny")
library("dplyr")
library("tidyverse")
library("ggplot2")
library("plotly")
library("rsconnect")

deployApp('/USERS/jsung/Documents/info201/assignments/a5-jsung1014')

# Use source() to excute the "app_ui.R" and "app_server.R" files. These will
# define the UI value and server function respectively.
source("app_ui.R")
source("app_server.R")

# Create a new "shinyApp()" using the loaded "ui" and "server" variables
shinyApp(ui = ui, server = server)