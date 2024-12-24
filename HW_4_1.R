# R course for beginners
# Week 4 part 1
# assignment by Amir Mano, id 205779788

#### prepare workspace ----
rm(list = ls()) #or Ctrl + Shift + F10 & Ctrl + L

# import packages
library(tidyverse)

#### create data ----

# creating variables
N = 500
sub_id <- seq(1,N)
sex <- factor(
  sample(c('m','f'), N, replace=T, prob = c(0.5, 0.5)),
  levels = c('m', 'f'), 
  labels = c("Male", "Female")
)
age <- runif(N, 15, 40)
iq <- rnorm(N, 100, 15)
has_depression <- factor(
  rbinom(N,1,0.083), 
  levels = c(0, 1), 
  labels = c("No Depression", "Depression")
  )
sleep <- rnorm(N, 7, 1.5)
df <- data.frame(sub_id, sex, age, iq, has_depression, sleep)

# adding IQ to data frame
write.csv(df, './HW_4.csv', row.names = FALSE)

