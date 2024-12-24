# R course for beginners
# Week 4 part 3
# assignment by Amir Mano, id 205779788

#### prepare workspace ----
rm(list = ls()) #or Ctrl + Shift + F10 & Ctrl + L

# import packages
library(tidyverse)
library(ggplot2)
library(ggdist)
library(effectsize)

# load variables
df <- read.csv('HW_4.csv')
df <- df|> mutate(sex=factor(sex))
df <- df|> mutate(has_depression=factor(has_depression))


#### test to check difference from 3 ----
t_test_result <- t.test(
  df$sleep,
  alternative = "two.sided",
  mu = 3,
  conf.level = 0.95
)
print(
  paste(
    'p-value:', t_test_result$p.value,
    ', with CI:', round(t_test_result$conf.int[1], 3), 
    '-', round(t_test_result$conf.int[2], 3)
  )
)

#### test to check difference by sleeping time ----
t_test_result <- t.test(data = df,
  sleep ~ has_depression,
  alternative = "two.sided",
  conf.level = 0.95
)
print(
  paste(
    'p-value:', t_test_result$p.value,
    ', with CI:', round(t_test_result$conf.int[1], 3), 
    '-', round(t_test_result$conf.int[2], 3)
  )
)

# calculating Cohen's d
d_automated <- cohens_d(
  df$sleep[df$has_depression=='Depression'],
  df$sleep[df$has_depression!='Depression']
)
mask <- df$has_depression==levels(df$has_depression)[1]
n <- c(
  length(df$has_depression[mask]), 
  length(df$has_depression[!mask])
  )
avg <-c(
  mean(df$sleep[mask]), 
  mean(df$sleep[!mask])
)
s <-c(
  sd(df$sleep[mask]), 
  sd(df$sleep[!mask])
)
sd_pooled <- sqrt(((n[1]-1)*s[1]^2+(n[2]-1)*s[2]^2)/(n[1]+n[2]-2))
d_manual <- (avg[1]-avg[2])/sd_pooled

cat(
    "cohen's d automated:", d_automated$Cohens_d,
    "\ncohen's d manual:", d_manual)

#### fit to linear model ----
model <- lm(data = df,
            sleep ~ has_depression)
print(model$coef)

