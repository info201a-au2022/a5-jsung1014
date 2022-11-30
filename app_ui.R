# library("shiny")
# library("dplyr")
# library("tidyverse")
# library("ggplot2")
# library("plotly")
# library("rsconnect")

intro_view <- tabPanel(
  "Introduction",
  h1(strong("Global Warming Cause")),
  img("", src = "https://cdn.vox-cdn.com/uploads/chorus_asset/file/13439425/shutterstock_285980522.jpg",
      width = "600", height = "300", align = "center"),
  p("In the post-industrial era (1850-1900), humans started burning fossil fuels, which increased levels of heat-trapping greenhouse gases in Earth's atmosphere, resulting in long-term warming of Earth's surface.
    The one of the main causes is releasing too much carbon dioxide. Because carbon dioxide in the atmosphere warms the planet, causing climate change. Nowdays, the majority of countries in the world keep releasing 
    untold amount of carbon dioxide. Getting know what the cause of global warming is really important task to figure out the solution"),
  h2(strong("Data Analysis")),
  p("The United States co2 in average: ", us_co2),
  p("The United States co2 in 2020: ", us_co2_2020),
  p("The World average c02 before 2000: ", world_avg_co2_before_2000),
)
chart_view <- tabPanel(
  "Carbon Dioxide",
  h1(strong("CO2 per country")),
  sidebarLayout(
    sidebarPanel(
      selectInput(
        inputId = "country",label = "Select Country:",
        choices = unique(df$country), selected = NULL
      ),
      sliderInput(
        inputId = "year", label = "Select year:",
        min = 1920, max = 2020, value = c(1920, 2020)
      ),
      h3(strong("Common Result")),
      p("The majority of countries in the dataset are increasing the total production-based emissions of carbon dioxide (CO₂)"),
    ),
    mainPanel(
      plotlyOutput("chart")
    )
  )
)

# Define UI
ui <- navbarPage(
  "Global Warming Cause",
  theme = shinythemes::shinytheme("cosmo"),
  intro_view,
  chart_view
)

