# R course for beginners
# Final Assignment - Main
# assignment by Amir Mano, id 205779788

# import libraries and functions
source("final_project/plotting_functions.R")

# read data
df <- read.csv('final_project/data.csv')

# exploratory plotting
pdf(file="final_project/exploratory_plotting.pdf")
plot_both_variables(df)
dev.off()
