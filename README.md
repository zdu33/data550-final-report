
# Final Project: Impact of Remote Work on Mental Health

## Data
The data for this project contains clinical and demographic information on the mental health impact of remote work. We aim to conduct a descriptive analysis on how different factors, such as work location and stress levels, vary across employees. The `data/` folder contains the raw data and a data dictionary.

------------------------------------------------------------------------

## Code Structure

`code/00_clean_data.R`

  - Reads in the raw dataset
  - Creates a `WORK_STATUS` variable to indicate the employee's work location (remote, hybrid, or onsite).
  - Saves the cleaned dataset as `data_clean.rds` in the `output/` folder.

`code/01_make_tables.R`

  - Creates `table_one` with descriptive statistics on demographic characteristics (frequency of gender, median age, and frequency of work status).
  - Creates a frequency table (`table_stress`) for self-reported stress levels among different work statuses (`remote`, `hybrid`, `onsite`).
  - All tables should be saved as an `.rds` object in `output/` folder

`code/02_make_figures.R`

  - Creates a grouped bar chart for stress levels (`stress_fig`) by work location.
The figure is saved as a `.png` file in the `output/` folder.
  - All figures should be saved as a `.png` object in `output/` folder

`code/03_render_report.R`

  - Renders the report
  - Specifies parameter value for `include_stress` when rendering the report.
  - If set to TRUE, `stress-related` figures and tables are included in the final report; if FALSE, they are excluded.

`report.Rmd`

  - Produces a descriptive analysis table for demographic characteristics
  - Produces a bar chart for `stress` levels
  - The parameter `include_stress` in the R Markdown file is used to include or exclude stress-related analysis as specified in the 03_render_report.R script.
  
------------------------------------------------------------------------

 
The Makefile, Rmarkdown (`report.Rmd`), and HTML report will be in the root directory of the project. The Rmarkdown will contain the tables and figures produced in the analysis.
  



