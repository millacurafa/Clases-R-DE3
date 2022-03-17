# load in library
library(tidyverse)

# load in data
cake <- read_csv("raw_data/cake-ingredients-1961.csv")
names <- read_csv("raw_data/cake_ingredient_code.csv")

# make data into tidy format, join on the full names (rather than the codes)
# remove any cases where ingredient not in the recipe & trim the cake column in case any trailing whitespace
cake_clean <-
  cake %>%
  pivot_longer(-Cake, names_to = "code", values_to = "amount") %>%
  rename(cake = Cake) %>%
  left_join(names) %>%
  drop_na(amount) %>%
  mutate(cake = str_trim(cake)) %>%
  select(-code)

# write clean data to a csv file
write_csv(cake_clean, "clean_data/cake_clean.csv")
