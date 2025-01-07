# R course for beginners
# Week 9 - Functions
# assignment by Amir Mano, id 205779788

# import libraries
library(tidyverse)

#### functions for creating data ----
create_df <- function(N){
  df <- data.frame(
    sub_id = factor(seq(1,N)),
    age = runif(N, 18, 60),
    gender = factor(sample(c('M','F'), N, replace=T)),
    RT <-  rnorm_range(N, 200, 6000),
    depression <-  rnorm_range(N, 0, 100),
    sleep <- rnorm_range(N, 2, 12)
  )
  colnames(df) <- c("sub_id", "age", "gender", "RT", "depression", "sleep")
  return(df)
}

rnorm_range <- function(N, min, max){
  mean_1 = (min+max)/2
  data <- rnorm(N, mean_1, (max-(mean_1))/2)
  data[data>max] = max
  data[data<min] = min
  return(data)
}

#### functions for analyzing ----
calc_stats <- function(df) {
  if (nrow(df) < 10) {
    print("data is too short")
    return("data is too short")
  }
  
  continuous_stats <- list()
  factor_stats <- list()
  
  # Iterate over columns
  for (colname in names(df)[2:length(df)]) {
    col <- df |> pull(colname)
    
    if (class(col) == "numeric" || class(col) == "integer") {
      # stats for non-factors
      stats <- data.frame(
        variable = colname,
        mean = mean(col, na.rm = TRUE),
        median = median(col, na.rm = TRUE),
        min = min(col, na.rm = TRUE),
        max = max(col, na.rm = TRUE)
      )
      continuous_stats[[colname]] <- stats
    } else if (class(col) == "factor") {
      # stats for factors
      counts <- as.data.frame(table(category = col))
      counts <- data.frame(variable = colname, counts)
      factor_stats[[colname]] <- counts
    }
  }
  
  # Combine results
  continuous_stats <- bind_rows(continuous_stats)
  factor_stats <- bind_rows(factor_stats)

  results <- bind_rows(
    mutate(continuous_stats, type = "continuous"),
    mutate(factor_stats, type = "factor"),
    .id = "stat_type"
  )
  return(results)
}