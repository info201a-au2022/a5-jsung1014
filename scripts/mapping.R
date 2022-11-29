# BuildMap file: function that returns a plotly map
library(plotly)
library(stringr)

# BuildMap function: fill this in with a function that returns a map:

mapping <- function(df, map.var) {
  # give state boundaries a white border
  l <- list(color = toRGB("white"), width = 2)
  
  # specify some map projection/options
  g <- list(
    scope = 'world',
    projection = list(type = 'scattergeo'),
    showlakes = TRUE,
    lakecolor = toRGB('white')
  )
  
  # Make equation for map color / text
  var.equation <- paste0('~', map.var)
  
  # Plot
  p <- plot_geo(df, locationmode = 'ISO-3') %>%
    add_trace(
      z = df[,map.var], text = ~country, locations = ~iso_code,
      color = df[,map.var], colors = 'Purples'
    ) %>%
    colorbar(title = "Color Title") %>%
    layout(
      title = str_to_title(map.var),
      geo = g
    )
  return(p)
}

