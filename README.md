
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
## How to Use

1. Using R Console, set the project root directory as the working directory.
  - Run `source('renv/activate.R')` to activate the project
2. Using terminal, go to the project root directory.
  - Run `make install` to synchronize the package environment.
  - Run `make report.html` to make the report.
3. To customize the report with information on stress levels, mental health conditions, and job satisfaction, edit the render function in 03_render_report.R:
  - Include stress-related insights by setting `stress = TRUE`.
  - Exclude stress-related insights by setting `stress = FALSE`.

------------------------------------------------------------------------

 
The Makefile, Rmarkdown (`report.Rmd`), and HTML report will be in the root directory of the project. The Rmarkdown will contain the tables and figures produced in the analysis.
  

------------------------------------------------------------------------

## Docker Image

The project includes a Docker image that can be used to generate the report in an automated manner. The image includes all necessary dependencies and R packages required to run the project. 

### Docker Image on DockerHub

You can find the Docker image for this project on DockerHub: [DockerHub Link](https://hub.docker.com/r/zdu33/report-generator).

------------------------------------------------------------------------
## Building the Docker Image

To build the Docker image locally, follow these steps:

1. Clone this repository to your local machine.
2. Ensure you have Docker installed and running on your machine.
3. Navigate to the project directory where the `Dockerfile` is located.
4. Run the following command to build the Docker image:

```bash
docker build -t report-generator.
```

This will build the Docker image using the `Dockerfile` in the current directory and tag it as `latest`.

------------------------------------------------------------------------
## Running the Automated Version of the Image

Once the image is built or pulled from DockerHub, you can run it to generate the report. The image includes the necessary R scripts and dependencies to execute the report generation process.

To run the container and generate the report, use the following command:

```bash
make docker-report
```

### Explanation of the `docker-report` Target:

This command will:
- Build a image according to the `Dockerfile`. 
- Start a Docker container from the image.
- Mount the local `report` directory into the container's `/app/report` directory.
- Execute the `make` process inside the container to run the four R scripts in sequence and generate the report.
- The generated `report.html` file will be available in the local `report` directory.

### `Makefile` Targets

The following `make` targets are available to run the report generation process manually or within the Docker container:

- `make install`: Installs R package dependencies using `renv`.
- `make clean`: Cleans up generated output files (e.g., `.rds`, `.png`, `.html`).
- `make docker-report`: Runs the full report generation process inside the Docker container.

------------------------------------------------------------------------
## Example Usage

To build and run the Docker container:

1. Run the report generation inside the container:

   ```bash
   make docker-report
   ```

The final report will be available in the `report` folder of the project directory.


Ensure that your `report.Rmd` file and all other necessary files are in place before running the automated version.


