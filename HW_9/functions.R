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
calc_stats <- function(df){
  if (nrow(df)<10)
    print("data is too short")
  
  continuous <- df[, !sapply(df, is.factor)] |> summary()
  continuous <- continuous[c(1, 3, 4, 6), ]
  
  factors <- df[, sapply(df, is.factor)] |> summary()
  factors <- data.frame(factors) |> filter(!is.na(Freq))
  results <- rbind(data.frame(continuous), factors)
  return(results)
}