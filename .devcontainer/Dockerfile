FROM rocker/r-ver:4.2.0

# Install system dependencies
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libharfbuzz-dev \
    libfribidi-dev \
    libpng-dev \
    libtiff5-dev \
    libjpeg-dev

# Install Quarto
RUN curl -LO https://github.com/quarto-dev/quarto-cli/releases/download/v1.3.340/quarto-1.3.340-linux-amd64.deb \
    && dpkg -i quarto-1.3.340-linux-amd64.deb \
    && rm quarto-1.3.340-linux-amd64.deb

# Install Pandoc (Quarto includes Pandoc, but we'll install it separately for completeness)
RUN curl -LO https://github.com/jgm/pandoc/releases/download/2.19.2/pandoc-2.19.2-1-amd64.deb \
    && dpkg -i pandoc-2.19.2-1-amd64.deb \
    && rm pandoc-2.19.2-1-amd64.deb

# Install R packages
RUN R -e "install.packages(c('rmarkdown', 'knitr', 'tidyverse', 'devtools'), repos='http://cran.rstudio.com/')"

# Set the working directory
WORKDIR /workspace

# Set the default command to R
CMD ["R"]
