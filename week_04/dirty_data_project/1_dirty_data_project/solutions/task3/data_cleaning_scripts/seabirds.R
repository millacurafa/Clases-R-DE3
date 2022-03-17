# load in libraries
library(tidyverse)
library(readxl)
library(janitor)

# load in data
ship_data <- read_excel("raw_data/seabirds.xls", sheet = "Ship data by record ID")
bird_data <- read_excel("raw_data/seabirds.xls", sheet = "Bird data by record ID", guess_max = 49019)

# clean columns
bird_data <- clean_names(bird_data)
ship_data <- clean_names(ship_data)

# rename columns and select necessary columns
bird_data_clean <-
  bird_data %>%
  rename(
    common_name = species_common_name_taxon_age_sex_plumage_phase,
    scientific_name = species_scientific_name_taxon_age_sex_plumage_phase,
  ) %>%
  select(record_id, common_name, scientific_name, species_abbreviation, count)

# select necessary columns
ship_data_clean <-
  ship_data %>%
  select(record_id, lat, long)

# join bird and ship data
bird_ship_data <-
  bird_data %>%
  left_join(ship_data, by=c("record", "record_id"))

# write clean data to csv
write_csv(bird_ship_data, "clean_data/birds_clean.csv")
  