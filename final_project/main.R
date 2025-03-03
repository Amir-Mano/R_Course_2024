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
plot_exploratory_to_pdf(df)

# process data
df <- remove_nans(df, "practice")
df <- generate_anonymized_ids(df)
df <- truncate_extreme_values(df)
df <- create_binary_values(df)

# linear regression model
models_linear <- multiple_linear_regression(df, "AoO")
plot_linear_models_to_pdf(df)

# logistic regression models
models_logistic_wind <- multiple_logistic_regressions(df, "is_wind")
models_logistic_keyboards <- multiple_logistic_regressions(df, "is_keyboard")
plot_logistic_models_to_pdf(df, models_logistic_wind, models_logistic_keyboards)

# plotting ROC graphs
aucs_wind <- compute_auc(models_logistic_wind, df, "is_wind")
aucs_keyboards <- compute_auc(models_logistic_wind, df, "is_keyboard")
plot_roc_to_pdf(aucs_wind, aucs_keyboards)
