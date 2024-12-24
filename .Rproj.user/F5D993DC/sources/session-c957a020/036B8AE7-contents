# R course for beginners
# Week 6 part 3
# assignment by Amir Mano, id 205779788

#### prepare workspace ----
rm(list = ls()) #or Ctrl + Shift + F10 & Ctrl + L
load('HW_6_1.RData')

# import packages
library(tidyverse)

#### regression models ----
# without scaling
model <- lm(data = df, satisfaction ~ stress)
model$coefficients[1:2]
# N = 20
# (Intercept)      stress 
#   99.956724   -9.962657
# N = 200
# (Intercept)      stress 
#   99.888501   -9.983768
# Original 100, -10

# Pearson
correlation <- cor(df$satisfaction, df$stress)
correlation
# -0.9993229

# scaling
df<- df|> mutate(s_satisfaction = scale(satisfaction))
df<- df|> mutate(s_stress = scale(stress))
model_scaled <- lm(data = df, s_satisfaction ~ s_stress)
model_scaled$coefficients[2]
# -0.9993229 - same as Pearson's r

