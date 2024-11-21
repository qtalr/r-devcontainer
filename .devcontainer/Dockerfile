FROM rocker/r-ver:4.4.1

ENV DEFAULT_USER="ruser"
ENV QUARTO_VERSION="1.3.450"
ENV PANDOC_VERSION="3.1.1"

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
RUN /rocker_scripts/install_quarto.sh
RUN /rocker_scripts/install_pandoc.sh
RUN /rocker_scripts/default_user.sh $DEFAULT_USER

# Add a non-root user with sudo privileges
RUN usermod -aG sudo ${DEFAULT_USER} && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER $DEFAULT_USER

# Add .Rprofile
COPY .Rprofile /home/ruser/.Rprofile

# Install pak and use it to install other R packages
RUN R -e "install.packages('pak', repos = 'https://cran.rstudio.com/')" && \
    R -e "pak::pkg_install(c('devtools', 'httpgd', 'knitr', 'languageserver', 'renv', 'rmarkdown', 'tinytex'))"
RUN R -e "tinytex::install_tinytex(force = TRUE)"

RUN sudo pip3 install -U radian
RUN sudo pip3 install -U jupyter

# Source the .profile file and start bash
CMD ["bash", "-c", "source ~/.profile && exec bash"]
