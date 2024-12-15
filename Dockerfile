FROM rocker/r-ver:4.4.2

WORKDIR /app

RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    pandoc \
    texlive-xetex \
    && rm -rf /var/lib/apt/lists/*

RUN Rscript -e "install.packages('renv')"
RUN Rscript -e "install.packages('rmarkdown')"

RUN mkdir -p /app/output
RUN mkdir -p /app/report

COPY code/ /app/code/
COPY data/ /app/data/
COPY report.Rmd /app/
COPY renv.lock /app/
COPY Makefile /app/

RUN Rscript -e "renv::restore()"

CMD ["make", "report.html"]