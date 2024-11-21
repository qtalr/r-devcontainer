FROM rocker/r-ver:4.3.1

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
    libjpeg-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Quarto and Pandoc using rocker scripts
RUN /rocker_scripts/install_quarto.sh 1.3.450
RUN /rocker_scripts/install_pandoc.sh 3.1.1

# Install pak and use it to install other R packages
RUN R -e "install.packages('pak', repos = 'https://cran.rstudio.com/')" && \
    R -e "pak::pkg_install(c('rmarkdown@2.21', 'languageserver@0.3.15', 'knitr@1.43', 'devtools@2.4.5', 'httpgd@1.3.1'))"

# Add .Rprofile
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'))" > ~/.Rprofile

# Add a non-root user
RUN useradd -m ruser
USER ruser

# Set the working directory
WORKDIR /workspace

# Set the default command to R
CMD ["R"]
