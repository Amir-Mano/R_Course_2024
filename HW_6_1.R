# R course for beginners
# Week 6 part 1
# assignment by Amir Mano, id 205779788

#### prepare workspace ----
rm(list = ls()) #or Ctrl + Shift + F10 & Ctrl + L

# import packages
library(tidyverse)

#### creating and saving variables ----
N = 20
df <- data.frame(
  sub_id = seq(1,N),
  age = runif(N, 18, 60),
  gender = factor(sample(c('M','F'), N, replace=T)),
  stress = runif(N, 0, 10)
)

# adding satisfaction score
b0 = 100
b1 = -10
df <- df |> 
  mutate(satisfaction = rnorm(N,b0 + stress*b1),30)
df <- df |> 
  mutate(satisfaction = if_else(satisfaction > 100, 100, satisfaction),
         satisfaction = if_else(satisfaction < 0, 0, satisfaction))

# save
save(df, file='HW_6_1.RData')