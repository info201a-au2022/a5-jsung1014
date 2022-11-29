# Build Scatter file: function that returns a plotly Scatter plot
library(plotly)
library(stringr)

### Build Scatter ###
scatter_plot <- function(df,  search = "", xvar = "population", yvar = "cement_co2") {
  # Get x and y max
  xmax <- max(df[,xvar]) * 1.5
  ymax <- max(df[,yvar]) * 1.5
  
  # Filter data based on search 
  data <- df %>% 
    filter(grepl(search, country))
  
  # Plot data
  p <- plot_ly(x = df[, xvar],
               y = df[, yvar], 
               mode="markers", 
               marker = list(
                 opacity = .4, 
                 size = 10
               )) %>% 
    layout(xaxis = list(range = c(0, xmax), title = xvar), 
           yaxis = list(range = c(0, ymax), title = yvar)
    )
  return(p)
}
