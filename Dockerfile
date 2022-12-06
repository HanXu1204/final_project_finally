FROM rocker/r-ubuntu

RUN apt-get update && apt-get install -y pandoc 
RUN apt-get install -y libcurl4-openssl-dev 

RUN apt-get install -y libxml2-dev 
RUN apt-get install -y libfontconfig1-dev
RUN apt-get install -y libnlopt-dev

RUN Rscript -e "install.packages('knitr')"
RUN Rscript -e "install.packages('here')"
RUN Rscript -e "install.packages('labelled')"
RUN Rscript -e "install.packages('gtsummary')"
RUN Rscript -e "install.packages('ggplot2')"
RUN Rscript -e "install.packages('rmarkdown')"
RUN Rscript -e "install.packages('dplyr')"

RUN mkdir output
RUN mkdir data
RUN mkdir code
COPY code code
COPY data data
COPY Makefile .
COPY report_diamond_prize.Rmd .

COPY README.md .
COPY .Rprofile .
COPY renv.lock .
RUN mkdir -p renv
COPY renv/activate.R renv
COPY renv/settings.dcf renv

#RUN Rscript -e "renv::restore(prompt=FALSE)"
RUN mkdir final_report

CMD make && mv report_diamond_prize.html final_report