# R course for beginners
# Week 5 part 1
# assignment by Amir Mano, id 205779788

#### prepare workspace ----
rm(list = ls()) #or Ctrl + Shift + F10 & Ctrl + L

# import packages
library(tidyverse)

#### creating and saving variables ----
N = 40
df <- data.frame(
  sub_id = seq(1,N),
  age = runif(N, 18, 60),
  gender = factor(sample(c('M','F'), N, replace=T)),
  group = factor(sample(c('Control','Clinical'), N, replace=T)),
  treatment = factor(sample(c('Placebo','TMS'), N, replace=T)),
  memory_score = rnorm(N, 70, 10)
)
df <- df |> 
  mutate(memory_score = if_else(memory_score > 100, 100, memory_score),
         memory_score = if_else(memory_score < 0, 0, memory_score))
save(df, file='HW_5_1.RData')