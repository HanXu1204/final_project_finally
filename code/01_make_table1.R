install.packages('here')
install.packages('gtsummary')
library(here)
here::i_am("code/01_make_table1.R")

data <- readRDS(
  file = here::here("output/data_clean.rds")
)

install.packages("car")
install.packages("carData")
library(car)
library(carData)
library(gtsummary)

table_one <- data |>
             select("cut", "table", "carat", "price_cat") |>
             tbl_summary(by = price_cat) |>
             modify_spanning_header(c("stat_1", "stat_2") ~ "**Price of The Diamond**") |>
             add_overall() |>
             add_p()

saveRDS(
  table_one,
  file = here::here("output/table_one.rds")
)