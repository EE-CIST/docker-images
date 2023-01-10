FROM r-base:4.2.2 AS cist-ee-RGeospatial

MAINTAINER Sebastien Rey-Coyrehourcq <sebastien.rey-coyrehourcq@univ-rouen.fr>

RUN apt-get update && apt-get install --no-install-recommends -y curl gdebi-core gdal-bin lbzip2 libfftw3-dev libgdal-dev libgeos-dev libgsl0-dev libgl1-mesa-dev libglu1-mesa-dev \
libhdf4-alt-dev libhdf5-dev libjq-dev libpq-dev libproj-dev libprotobuf-dev libnetcdf-dev \
libsqlite3-dev libssl-dev libudunits2-dev netcdf-bin protobuf-compiler sqlite3 tk-dev unixodbc-dev libcurl4-openssl-dev libudunits2-dev git pandoc 

ARG QUARTO_VERSION="1.2.313"

ENV RENV_VERSION 0.16.0
ENV RENV_PATHS_LIBRARY renv/library

RUN curl -o quarto-linux-amd64.deb -L https://github.com/quarto-dev/quarto-cli/releases/download/v${QUARTO_VERSION}/quarto-${QUARTO_VERSION}-linux-amd64.deb
RUN gdebi --non-interactive quarto-linux-amd64.deb

#https://cran.r-project.org/web/packages/renv/vignettes/docker.html
RUN install2.r --error remotes
RUN Rscript -e "remotes::install_github('rstudio/renv@${RENV_VERSION}')"

WORKDIR /project
COPY /utils/renv.lock .

RUN R -e 'options(warn = 2); renv::restore()'
