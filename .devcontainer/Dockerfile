FROM rocker/r-ver:4.3.1

# Install system dependencies including sudo
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
    git \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Quarto and Pandoc using rocker scripts
RUN /rocker_scripts/install_quarto.sh 1.3.450
RUN /rocker_scripts/install_pandoc.sh 3.1.1

# Install pak and use it to install other R packages
RUN R -e "install.packages('pak', repos = 'https://cran.rstudio.com/')" && \
    R -e "pak::pkg_install(c('devtools', 'httpgd', 'knitr', 'languageserver', 'renv', 'rmarkdown'))"

# Add .Rprofile
RUN echo "options(repos = c(CRAN = 'https://cran.rstudio.com/'))" > ~/.Rprofile

# Add a non-root user with sudo privileges
RUN useradd -m ruser && \
    usermod -aG sudo ruser && \
    echo "ruser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/ruser && \
    chmod 0440 /etc/sudoers.d/ruser

USER ruser

# Create workspace directory and set ownership
RUN mkdir -p /home/ruser/workspace && chown ruser:ruser /home/ruser/workspace

# Set the working directory
WORKDIR /home/ruser/workspace

# Set the default command to R
CMD ["R"]
