# R course for beginners
# Week 9 - Analysis
# assignment by Amir Mano, id 205779788

# import libraries and functions
source("HW_9/functions.R")

# create data
N = 15
data <- create_df(N)

# descriptive statistics
stats <- calc_stats(data, 10, 14)
print(stats)



