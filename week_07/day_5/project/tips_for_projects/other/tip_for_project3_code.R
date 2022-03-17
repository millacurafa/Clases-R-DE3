# Task 1
data <- data.frame(date = seq(2008, 2019, by =1),
                   revenue = abs(rnorm(12, 0, 0.02) * 10000), 
                   costs = abs(rnorm(12, 0, 0.02) * 9000))

library(tidyverse)

data2 <- pivot_longer(data, -date, names_to = "type")

ggplot(data2, aes(x=date, y = value, colour = type)) + 
  geom_line() +
  labs(title="Cost and Revenue over time",
       x ="Date", y = "Value (£)") +
  scale_x_continuous(breaks=seq(2008,2019,1))

# Task 2

ggplot(data, aes(x=date, y = revenue)) + 
  geom_col(fill = "dodgerblue") +
  labs(title="Cost over time",
       x ="Date", y = "Value (£)") +
  scale_x_continuous(breaks=seq(2008,2019,1)) 

colours<-colorRampPalette(c("#deebf7", "#08306b"))
colours(12)

ggplot(data, aes(x=date, y = revenue, fill = date)) + 
  geom_col() +
  labs(title="Cost over time",
       x ="Date", y = "Value (£)") +
  scale_x_continuous(breaks=seq(2008,2019,1)) +
  scale_colour_gradient(low = "gray0", high = "gray100")

