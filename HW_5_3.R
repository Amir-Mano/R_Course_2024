# R course for beginners
# Week 5 part 3
# assignment by Amir Mano, id 205779788

#### prepare workspace ----
rm(list = ls()) #or Ctrl + Shift + F10 & Ctrl + L
load('HW_5_1.RData')

# import packages
library(tidyverse)
library(effectsize)

# prepare variables
if(df$group[1]=='Clinical')
{
  contrasts(df$group)<- c(1,0)
}
if(df$treatment[1]=='TMS')
{
  contrasts(df$group)<- c(1,0)
}

#### ANOVA ----
#linear regression
model = lm(memory_score ~ group*treatment, data = df)

print(model)
summary(model)

# Results
# Coefficients:
#   (Intercept)               group1         treatmentTMS  group1:treatmentTMS  
#        66.504                5.868                3.705               -8.011 