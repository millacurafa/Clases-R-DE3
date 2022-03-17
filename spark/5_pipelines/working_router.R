# SLACK THIS OUT!!
library(sparklyr)
library(tidyverse)

sc <- spark_connect(master = "local")
logreg_model <- ml_load(sc, "logreg_model")

# the following line tells `plumber` that function get_working_prob() will be triggered
# when the router detects an incoming POST request to endpoint /working_prob
#* @post /working_prob
get_working_prob <- function(age, essay_length, sex, drinks, drugs) {
  
  incoming_data <- tibble(
    age = age,
    essay_length = essay_length,
    sex = sex,
    drinks = drinks,
    drugs = drugs
  )
  
  incoming_data <- copy_to(sc, incoming_data, overwrite = TRUE)
  
  prob <- ml_transform(logreg_model, incoming_data) %>%
    dplyr::pull(probability)
  
  return(
    paste("probability not_working = (FALSE, TRUE):", prob)
  )
}

