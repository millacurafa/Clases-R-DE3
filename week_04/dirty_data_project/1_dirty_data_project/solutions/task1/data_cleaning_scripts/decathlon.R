# load in the libraries
library(tidyverse)
library(janitor)

# load in the data
decathlon <- readRDS("raw_data/decathlon.rds")

# clean column names
decathlon_cleannames <- clean_names(decathlon)

# rename some of the columns (including the rownames) to make more human readable
# adjust some columns to tidy/convert format
# reshape data to long format
decathlon_reformat <-
  decathlon_cleannames %>%
  rownames_to_column("surname") %>%
  rename(
    running_100m = x100m,
    running_400m = x400m,
    hurdle_110m = x110m_hurdle,
    running_1500m = x1500m,
    javelin = javeline
  ) %>%
  mutate(
    surname = tolower(surname),
    competition = as.character(competition)
  ) %>%
  pivot_longer(running_100m:running_1500m, names_to = "event", values_to = "score")

# write clean data to csv
write_csv(decathlon_reformat, "clean_data/decathlon_clean.csv")