# Script file to make the subsetted data from Apple Mobility data to tally up
# cities and counties based on transportation type in a single state. We're
# making a function out of this.

# Keren Oczon
# kooczon@dons.usfca.edu
# September 26, 2021


#load the package "dplyr"
library("dplyr")

# create a function where we take the subset of any state and have their data
# tallied based on cities and counties by their transportation type

tally_cities_counties_of_state <- function(input_file_name) {
  # read in csv file of the subsetted state data
  state_data <- read.csv(input_file_name)

  #use dplyr to take the cities, counties, and types of transportation
  # in a chain
  count_cities_counties_by_type <- state_data %>%
    select(geo_type, region, transportation_type) %>%
    group_by(geo_type, transportation_type) %>%
    tally()

  # check that the tally data actually has data in it
  if (nrow(count_cities_counties_by_type) == 0) {
    stop("ERROR: No rows detected. Did you make a mistake?")
  }
  #write csv file of the dplyr chain
  write.csv(count_cities_counties_by_type,
            file = paste0("output/tally_cities_counties_of_state/",
                          tools::file_path_sans_ext(
                            basename(input_file_name)),
                          "_cities_counties.csv"))
}
