# load libraries
library(tidyverse)
library(janitor)

# read in data
dogs <- read_csv("raw_data/dog_survey.csv")

# some inital cleaning
dogs1 <- dogs %>%
  remove_empty("cols") %>%
  rename("title" = "Title") %>%
  mutate(amount_spent_on_dog_food = str_replace(amount_spent_on_dog_food, "£", "")) %>%
  mutate_all(str_replace_all, "-", NA_character_) %>%
  mutate(dog_gender = toupper(dog_gender)) %>%
  mutate(dog_size = toupper(dog_size))

# check of duplicates of IDs
dogs1 %>%
  select(id) %>%
  group_by(id) %>%
  summarise(count_id = n()) %>%
  arrange(desc(count_id)) %>%
  filter(count_id > 1)


# remove rows which are duplicated
dogs2 <- dogs1 %>%
  distinct()

# check removed
dogs2 %>%
  select(id) %>%
  group_by(id) %>%
  summarise(count_id = n()) %>%
  arrange(desc(count_id)) %>%
  filter(count_id > 1)

# manual changing of typing issues
dogs3 <- dogs2 %>%
  mutate(
    dog_size = if_else(dog_size == "MEDIUM SIZED", "M", dog_size),
    dog_size = if_else(dog_size == "LARGE", "L", dog_size),
    dog_size = if_else(dog_size == "SMALLISH", "S", dog_size),
    dog_size = if_else(dog_size == "NO", NA_character_, dog_size),
    dog_size = if_else(dog_size == "N/A", NA_character_, dog_size)
  ) %>%
  mutate(
    #    dog_gender = if_else(dog_gender == "1 MALE AND 1 FEMALE", "M,F", dog_gender),
    dog_gender = if_else(dog_gender == "FEMALE", "F", dog_gender),
    dog_gender = if_else(dog_gender == "MALE", "M", dog_gender),
    dog_gender = if_else(dog_gender == "FEMLAE", "F", dog_gender),
    dog_gender = if_else(dog_gender == "DON’T KNOW", NA_character_, dog_gender),
    dog_gender = if_else(dog_gender == "UNKNOWN", NA_character_, dog_gender),
    dog_gender = if_else(dog_gender == "UNKOWN", NA_character_, dog_gender)
  ) %>%
  mutate(
    amount_spent_on_dog_food = if_else(amount_spent_on_dog_food == "Between 10 and £20", "15", amount_spent_on_dog_food),
    amount_spent_on_dog_food = str_remove(amount_spent_on_dog_food, "[^[:alnum:]+\\.]"),
    amount_spent_on_dog_food = str_remove(amount_spent_on_dog_food, "[\\!]+"),
    amount_spent_on_dog_food = str_remove(tolower(amount_spent_on_dog_food), "[a-z ]*"),
    amount_spent_on_dog_food = if_else(amount_spent_on_dog_food == "", NA_character_, amount_spent_on_dog_food),
  ) %>%
  mutate(
    dog_age = if_else(dog_age == "5 and 4", "5,4", dog_age),
    dog_age = if_else(dog_age == "Less than 20", NA_character_, dog_age),
    dog_age = if_else(dog_age == "12+", NA_character_, dog_age)
  )

# filter out those where more than 1 dog per entry (alternative is to split these into seperate entries)
# make numeric columns numeric
# assumption: any negatives are meant to be the same positive value
dogs4 <- dogs3 %>%
  filter(nchar(dog_gender) == 1) %>%
  mutate(amount_spent_on_dog_food = ifelse(amount_spent_on_dog_food < 0,
    as.numeric(-amount_spent_on_dog_food), as.numeric(amount_spent_on_dog_food)
  )) %>%
  mutate(dog_age = as.numeric(dog_age))



# write data to csv
write.csv(dogs4, "clean_data/dog_survey_clean.csv")



