# R course for beginners
# Final Assignment - Main
# assignment by Amir Mano, id 205779788

# import libraries and functions
rm(list = ls()) #or Ctrl + Shift + F10 & Ctrl + L
source("final_project/plotting_functions.R")
source("final_project/data_processing_functions.R")

# read data
df <- read.csv('final_project/data.csv')

# exploratory plotting
df <- fill_instrument_group(df)
plot_graphs_to_pdf(df)

# process data
df <- remove_nans(df)
df <- generate_anonymized_ids(df)
df <- truncate_extreme_values(df)
df <- create_binary_values(df)

