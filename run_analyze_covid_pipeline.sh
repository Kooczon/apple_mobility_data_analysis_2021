#!/bin/bash

# A bas script to drive the rendering of an Rmarkdown file using some
# paramaters passed in from the shell

Rscript -e "rmarkdown::render('Analysis.Rmd')"
