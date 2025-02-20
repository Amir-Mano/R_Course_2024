# R course for beginners
# Final Assignment - Main
# assignment by Amir Mano, id 205779788

# import libraries and functions
rm(list = ls()) #or Ctrl + Shift + F10 & Ctrl + L
source("final_project/plotting_functions.R")
source("final_project/data_processing_functions.R")
source("final_project/analysis_functions.R")

# read data
df <- read.csv('final_project/data.csv')

# exploratory plotting
df <- fill_instrument_group(df)
plot_graphs_to_pdf(df)

# process data
df <- remove_nans(df, df$practice)
df <- generate_anonymized_ids(df)
df <- truncate_extreme_values(df)
df <- create_binary_values(df)

# linear regression model
linear_regression(df, "AoO", c("practice"))

# logistic regression models
models <- multiple_logistic_regressions(df, "is_wind")
multiple_logistic_regressions(df, df$is_keybard)


