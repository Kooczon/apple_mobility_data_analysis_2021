#!/bin/bash

# A bas script to drive the rendering of an Rmarkdown file using some
# paramaters passed in from the shell
# this script expects two command line parameters
# the fisrt should be a US state, and the second is the raw apple mobility
# data csv file downloaded from apple.com

# Keren Oczon
# October 25, 2021
# kooczon@dons.usfca.edu

Rscript -e "rmarkdown::render('Analysis.Rmd', \
            params = list(state = '$1', \
            data = '$2'))"
