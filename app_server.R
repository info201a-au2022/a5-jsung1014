library("shiny")
library("dplyr")
library("tidyverse")
library("ggplot2")
library("plotly")
library("rsconnect")

# loading dataset
df<- read.csv("./data/owid-co2-data.csv")

us_co2 <- df %>% 
  filter(country == "United States") %>%
  mutate(total_co2 = sum(co2, na.rm = TRUE))%>%
  summarize(average_co2 = mean(total_co2))%>%
  pull(average_co2)

us_co2_2020 <- df %>% 
  filter(year == 2020) %>% 
  filter(country == "United States") %>% 
  pull(co2)

world_avg_co2_before_2000<- df %>%
  filter(year > 1980, year < 2000) %>%
  filter(country == "World") %>%
  mutate(total_co2 = sum(co2, na.rm = TRUE))%>%
  summarize(average_co2 = mean(total_co2))%>%
  pull(average_co2)

world_avg_co2_after_2000 <- df %>%
  filter(year > 2000) %>%
  filter(country == "World") %>%
  mutate(total_co2 = sum(co2, na.rm = TRUE))%>%
  summarize(average_co2 = mean(total_co2))%>%
  pull(average_co2)


# Define server logic
server <- function(input, output){
  
  plot <- function(country,year){
    data_for_plot <- df %>%
      filter(country %in% input$country) %>% 
      filter(`year` >= input$year[1] & `year` <= input$year[2])
    return(data_for_plot)
  }
  output$chart <- renderPlotly({
    ggplotly(ggplot(plot(input$country & input$year),aes(x= `year`, y= `co2`)) +
               geom_line(color = "red") +
               labs(title = "The Amount Of Use Of Carbon Dioxide", x = "year", y = "Carbon Dioxide(co2)"))
  })
}




