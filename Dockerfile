#################################################################
# Dockerfile
# Description:      R and required packages to run machine learning methods with caret
# Base Image:       r-base:3.6.3
#################################################################
#R image to be the base in order to build our new image
FROM r-base:3.6.3

#Maintainer and author
MAINTAINER Magdalena Arnal <mgdrnl@gmail.com>

#Install Ubuntu extensions in order to run r
RUN apt-get update && apt-get install -y \
    r-cran-xml \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev
    
ENV PATH=pkg-config:$PATH

#Install packages from CRAN
RUN Rscript -e 'install.packages(c("R.utils","data.table", "gtools", "gplots", "caret"))'

