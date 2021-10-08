# the goal of this script is to create a for loop for the subsetted states
# to have their data be changed from wide to long format

# Keren Oczon
# kooczon@dons.usfca.edu
# October 06, 2021

# load functions
source("code/functions/change_subset_state_data_to_long.R")

for (subsetted_state in c("Arizona", "Florida", "Montana", "Utah",
                          "Georgia")) {
  subset_data_wide_to_long(input_state_file =
                             paste0("output/subsetted_state/",
                                    "applemobilitytrends-2021-09-23_",
                                    subsetted_state,
                                    ".csv"))
}
