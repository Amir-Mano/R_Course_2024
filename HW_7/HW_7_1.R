# R course for beginners
# Week 7 part 1
# assignment by Amir Mano, id 205779788

# Additional note for HW_8 purposes:
# This code was written by Amir Mano
# The code was written in 20/12/2024
# The code read data from 30 csv files
# The code organize and filter the data 
# into raw_data and filtered_data

#### create raw data ----
rm(list = ls()) #or Ctrl + Shift + F10 & Ctrl + L
library(tidyverse)

# load data
fnames <- dir("stroop_data")
df = data.frame()
for (ind in c(1:length(fnames))){
  temp_df <- read.csv(file.path('stroop_data',fnames[ind]))
  df <- rbind(df, temp_df)
}

# organize data
df <- df |> mutate(task = ifelse(grepl("ink", condition), "ink_naming", "word_reading"))
df <- df |> mutate(congureancy = ifelse(grepl("incong", condition), "incongureant", "congureant"))
df <- df |> mutate(accuracy = ifelse(correct_response==participant_response, 1, 0))
df <- df |> mutate(task = factor(task))
df <- df |> mutate(congureancy = factor(congureancy))     
df <- df |> select(subject, block, trial, task, congureancy, accuracy, rt)

# make sure the contrast are in alphabetical order
contrasts(df$task) <- contr.treatment(2) 
contrasts(df$congureancy) <- contr.treatment(2)

save(df, file='raw_data.RData')

#### create filtered data ----
rm(list = ls())
load('raw_data.rdata')

# remove non-relevant data
N <- length(unique(df$subject))
remove_indexes <-is.na(df$rt) | df$rt>3000 | df$rt<300
df<- df|>filter(!remove_indexes)

# calculate ratio
count_trial <- c()
for (subj in unique(df$subject)){
  count_trial <- c(count_trial, sum(df$subject==subj))
}
ratio <- count_trial/400
cat('Average ratio:', mean(ratio), '\n', 'SD ratio:', sd(ratio), '\n')

save(df, file='filtered_data.RData')