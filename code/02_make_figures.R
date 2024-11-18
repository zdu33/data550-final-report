# 02_make_figures.R

# Load necessary libraries
library(ggplot2)
library(dplyr)
library(here)
here::i_am("code/02_make_figures.R")
# Read in the cleaned dataset
data <- readRDS(here::here("output/data_clean.rds"))

# Create stress_fig: Bar chart for stress levels by work status
stress_fig <- ggplot(data, aes(x = WORK_STATUS, fill = Stress_Level)) +
  geom_bar(position = "dodge") +
  labs(title = "Stress Levels by Work Location", x = "Work Location", y = "Frequency") +
  theme_minimal()

# Save the figure as .png
ggsave(filename = here::here("output/stress_fig.png"), plot = stress_fig)
