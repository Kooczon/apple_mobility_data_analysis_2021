# Script to read Apple's Mobility Data from a CSV File
# and subset the data to include rows from Mississippi
# and create a csv file with only that subset

# Keren Oczon
# kooczon@dons.usfca.edu
# September 19th, 2021s

# create a function to subset any US state out of the full dataset
# this should also create an output CSV file that is named based on the state
# that is subsetted

library("readr")
library("dplyr")

subset_mobility_data_to_state <- function(input_file_name,
                                          state_to_subset) {
  # read in complete csv file of the total Covid data
  all_covid_data <- readr::read_csv(input_file_name)

  # subset the dataset that only contains rows in sub.region column that has
  # the state name in it, but we want all columns.
  state_data <- all_covid_data %>%
    dplyr::filter(`sub-region` == state_to_subset)

  # check that the subsetted data actually has data in it
  if (nrow(state_data) == 0) {
    stop("ERROR: No rows matching given state name. Did you make a typo?")
  }

  # sub out spaces using underscores so file is named correctly
  state_no_spaces <- gsub(state_to_subset,
                          pattern = " ",
                          replacement = "_")

  # save the state data to a new csv file in the output directory
  readr::write_csv(state_data, file = paste0("output/subsetted_state/",
                                      tools::file_path_sans_ext(
                                        basename(input_file_name)),
                                      "_",
                                      state_no_spaces,
                                      ".csv"))

  return(state_data)
}
