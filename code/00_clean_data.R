install.packages('here')
install.packages('labelled')
install.packages('gtsummary')

library(here)
library(labelled)
library(gtsummary)


here::i_am("code/00_clean_data.R")
absolute_path_to_data <- here::here("data", "Diamonds_Prices2022.csv")
data <- read.csv(absolute_path_to_data, header = TRUE)




var_label(data) <- list(
  X = "Number",
  carat = "Diamond Sizes",
  cut = "Diamond Quality",
  color = "Diamond Color",
  clarity = "Diamond Clarity",
  depth = "Diamond Depth",
  table = "Size of Table Facet ",
  price = "Price",
  x = "Length (mm)",
  y = "Width (mm)",
  z = "Depth (mm)"
)

data$price_cat <- ifelse(data$price < 2401, "Cheap", "Expensive")

saveRDS(
  data, 
  file = here::here("output/data_clean.rds")
)
