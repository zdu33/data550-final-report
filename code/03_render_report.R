# 03_render_report.R

# Load necessary library
library(rmarkdown)
library(here)
here::i_am("code/03_render_report.R")

if (!dir.exists("report")) {
  dir.create("report")
}

# Render the report
render("report.Rmd", output_format = "html_document", output_file ="/app/report/report.html")