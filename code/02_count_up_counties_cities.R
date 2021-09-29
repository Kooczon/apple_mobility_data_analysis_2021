# the goal of this script is to use dplyr package to count up the number of
# of cities and counties in a given state that have detailed Apple mobility
# data available and then eventually to save it to a csv

# Keren Oczon
# September 25, 2021
# kooczon@dons.usfca.edu

# We would like to get a count of the number of cities and the number of
# counties in a given state that have driving mobility data. The input to this
# will be the output of the previous script namely the state csv files that
# were already subsetted.

# load functions
source("code/functions/tally_cities_counties_of_state.R")


# Testing a for loop of this function
for (subsetted_state in c("Arizona", "Florida", "Montana", "Utah",
                          "Georgia")) {
  tally_cities_counties_of_state(input_file_name =
                                   "output/applemobilitytrends-2021-09-18_Arizona.csv")
}
list.files("output/")
