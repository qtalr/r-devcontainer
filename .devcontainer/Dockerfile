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

# Install Quarto and Pandoc using rocker scripts
RUN /rocker_scripts/install_quarto.sh
RUN /rocker_scripts/install_pandoc.sh

# Install R packages
RUN R -e "install.packages(c('rmarkdown', 'knitr', 'tidyverse', 'devtools'), repos='http://cran.rstudio.com/')"

# Set the working directory
WORKDIR /workspace

# Set the default command to R
CMD ["R"]
