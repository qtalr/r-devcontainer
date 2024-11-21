FROM rocker/r-ver:4.4.1

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
    curl \
    python3 \
    openssh-client \
    pip \
    git \
    sudo \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Install Quarto and Pandoc using rocker scripts
RUN /rocker_scripts/install_quarto.sh 1.3.450
RUN /rocker_scripts/install_pandoc.sh 3.1.1


# Add a non-root user with sudo privileges
RUN useradd -m ruser && \
    usermod -aG sudo ruser && \
    echo "ruser ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers.d/ruser && \
    chmod 0440 /etc/sudoers.d/ruser

USER ruser

# Add .Rprofile
RUN copy .Rprofile /home/ruser/.Rprofile

# Install pak and use it to install other R packages
RUN R -e "install.packages('pak', repos = 'https://cran.rstudio.com/')" && \
    R -e "pak::pkg_install(c('devtools', 'httpgd', 'knitr', 'languageserver', 'renv', 'rmarkdown', 'tinytex'))"
RUN R -e "tinytex::install_tinytex(force = TRUE)"

RUN pip3 install -U radian
RUN pip3 install -U jupyter

# Create workspace directory and set ownership
RUN mkdir -p /home/ruser/workspace && chown ruser:ruser /home/ruser/workspace

# Set the working directory
WORKDIR /home/ruser/workspace

# Source the .profile file and start bash
CMD ["bash", "-c", "source ~/.profile && exec bash"]
