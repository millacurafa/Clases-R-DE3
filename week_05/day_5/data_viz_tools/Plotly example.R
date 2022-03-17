library(plotly)

data <- diamonds[sample(nrow(diamonds), 1000), ]

plot_ly(
  data, x = ~carat, y = ~price,
  # Hover text:
  text = ~paste("Price: ", price, '$<br>Cut:', cut),
  color = ~carat, size = ~carat
)