#!/bin/bash

# A bas script to drive the rendering of an Rmarkdown file using some
# paramaters passed in from the shell

Rscript -e "rmarkdown::render('Analysis.Rmd', \
            params = list(state = 'Arizona', \
            data = 'data/raw_data/applemobilitytrends-2021-09-18.csv'))"
