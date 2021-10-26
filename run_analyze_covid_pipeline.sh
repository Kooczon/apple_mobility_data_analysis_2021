#!/bin/bash

# A bas script to drive the rendering of an Rmarkdown file using some
# paramaters passed in from the shell
# this script expects two command line parameters
# the fisrt should be a US state, and the second is the raw apple mobility
# data csv file downloaded from apple.com

# Keren Oczon
# October 25, 2021
# kooczon@dons.usfca.edu

if [ $# -eq 0 ]
then
  echo "To run this script, supply two arguments:"
  echo "The first is the name of the state to be analyzed."
  echo "The second is the path too the mobility data csv file."
  exit 1
fi

state=$1
state=${state// /_}


Rscript -e "rmarkdown::render('Analysis.Rmd',\
            params = list(state = '$1',\
            data = '$2'),\
            output_dir = 'output',\
            output_file = 'Analysis_$state')"
