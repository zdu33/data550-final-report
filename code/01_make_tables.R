
# Load necessary libraries
library(dplyr)
library(tidyr)
library(here)
library(readr)

here::i_am("code/01_make_tables.R")
# Read in the cleaned dataset
data <- readRDS(here::here("output/data_clean.rds"))


# Create table_one: Demographic characteristics

# Create Gender Frequency table
gender_freq <- data %>%
  count(Gender, name = "Frequency")

# Calculate Median Age
median_age <- data %>%
  summarise(Median_Age = median(Age, na.rm = TRUE))

# Create Work Status Frequency table
work_status_freq <- data %>%
  count(WORK_STATUS, name = "Frequency")

# Combine results into a list or print separately
table_one <- list(
  Gender_Frequency = gender_freq,
  Median_Age = median_age,
  Work_Status_Frequency = work_status_freq
)




# Save tables as .rds objects
saveRDS(table_one, file = here::here("output/table_one.rds"))
