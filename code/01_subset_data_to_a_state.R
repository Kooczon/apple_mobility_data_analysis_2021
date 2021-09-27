# Script to read Apple's Mobility Data from a CSV File
# and subset the data to include rows from Mississippi
# and create a csv file with only that subset
# uses functions in the code/function directory

# Keren Oczon
# kooczon@dons.usfca.edu
# September 19th, 2021

# Load functions
source("code/functions/subset_mobility_data_to_state.R")

# test out the use of the function
subset_mobility_data_to_state(
  input_file_name = "data/raw_data/applemobilitytrends-2021-09-18.csv",
  state_to_subset = "California")
