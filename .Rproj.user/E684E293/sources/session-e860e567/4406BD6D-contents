
# 00_clean_data.R

# Load necessary libraries
library(dplyr)
library(here)

# Set the working directory to the location of this script
here::i_am("code/00_clean_data.R")

# Read the raw dataset
data_path <- here::here("data/Impact_of_Remote_Work_on_Mental_Health.csv")
data <- read.csv(data_path)

# Create WORK_STATUS variable (remote, hybrid, onsite)
data <- data %>%
  mutate(WORK_STATUS = case_when(
    Work_Location == "Remote" ~ "Remote",
    Work_Location == "Hybrid" ~ "Hybrid",
    Work_Location == "Onsite" ~ "Onsite",
    TRUE ~ NA_character_  # for missing values
  ))

# Save cleaned data as an RDS file
saveRDS(data, file = here::here("output/data_clean.rds"))

