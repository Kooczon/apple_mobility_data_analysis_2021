# Script file to change the mobility data from wide to long
# Taking the subsetted state data and making into a long
# using the Pivot_longer() command

# Keren Oczon
# kooczon@dons.usfca.edu
# October 06, 2021

# load packages
library("readr")
library("tidyr")

# make function to change subsetted state data wide into long

subset_data_wide_to_long <- function(input_state_file) {

  # read in the data as a csv file
  subsetted_state <- readr::read_csv(input_state_file)

  #change to long format data
  state_data_long <- subsetted_state %>%
    pivot_longer(
    cols = starts_with("20"),
    names_to = "date",
    names_prefix = "X",
    values_to = "relative_mobility"
  )

  # check that the subsetted data actually has data in it
  if (nrow(state_data_long) == 0) {
    stop("ERROR: No rows match. Did you make a mistake?")
  }

  # write new csv of long format of data
  readr::write_csv(state_data_long,
                   file = paste0("output/",
                                 "subsetted_state_long/",
                                 tools::file_path_sans_ext
                                 (basename(input_state_file)),
                                 "_",
                                 "long",
                                 ".csv"))

  return(state_data_long)
}
