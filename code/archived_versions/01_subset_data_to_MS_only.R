# Script to read Apple's Mobility Data from a CSV File
# and subset the data to include rows from Mississippi
# and create a csv file with only that subset

# Keren Oczon
# kooczon@dons.usfca.edu
# September 9th, 2021

# read in complete csv file of the total Covid data
all_covid_data <- read.csv("data/raw_data/applemobilitytrends-2021-08-31.csv")

# subset the dataset that only contains rows in sub.region column to
# "Mississippi" only
mississippi_data <- all_covid_data[all_covid_data$sub.region == "Mississippi", ]

# save the Mississippi data to a new csv file in the output directory
write.csv(mississippi_data, file = "output/mississippi_apple_mobility_data.csv")
