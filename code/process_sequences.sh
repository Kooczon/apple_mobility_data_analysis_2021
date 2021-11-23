#!/bin/bash

# Keren Oczon
# November 2, 2021
# kooczon@dons.usfca.edu

# Bash script to process and analyze sequences in the compressed SARS-CoV-2 fasta file.
# The goal is to gather and state the total number of sequences.
# We also want to tally the sequences in the data from each country and
# sort the output from largest to smallest

# Having a quick check to state that the command line arguments are present
if [ $# -eq 0 ]
then
        echo "One argument is needed to run the script:"
        echo "First, provide the path to the fasta file sequence."
        exit 1
fi

# Check if the file has something in it 
if ! grep -q '[^[:space:]]' "$1"; then
	echo "There is nothing in the file."
else
	echo "There is data in the file"
fi

# Tally SARS-CoV-2 sequences and sort by country
# Check if total seq count is requested
	echo "The total number of sequences is:"
	bioawk -c fastx 'END{print NR}' "$1"

# Output sequences by country tally
bioawk -c fastx '{print $comment}' "$1" | awk '{split($0,x,"|");print x[21]}' | sort | uniq -c | sort -rn
