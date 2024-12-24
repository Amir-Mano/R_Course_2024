# R course for beginners
# Week 4 part 2
# assignment by Amir Mano, id 205779788

#### prepare workspace ----http://127.0.0.1:29743/graphics/plot_zoom_png?width=1050&height=863
rm(list = ls()) #or Ctrl + Shift + F10 & Ctrl + L

# import packages
library(tidyverse)
library(ggplot2)
library(ggdist)

# load variables
df <- read.csv('HW_4.csv')
df <- df|> mutate(sex=factor(sex))
df <- df|> mutate(has_depression=factor(has_depression))

#### descriptive statistics ----
# extracting counts
gender_counts <- sum(df |> pull(sex) |> as.numeric() == 1)
depression_count <- sum(df |> pull(has_depression) |> as.numeric() == 1)

# printing stats
cat('Number of subjects:', nrow(df), '\n',
    'Number by gender:', levels(df$sex)[1], gender_counts,
    ',', levels(df$sex)[2], nrow(df)-gender_counts,'\n',
    'Range of ages:', df |> pull(age) |> min() |> floor(), 
    '-', df |> pull(age) |> max() |> ceiling(), '\n',
    'Average IQ:', df |> pull(iq) |> mean(), ' (', df |> pull(iq) |> sd(), ')\n',
    'Average sleep:', df |> pull(sleep) |> mean(), ' (', df |> pull(sleep) |> sd(), ')\n',
    'Median percentage of depression:', depression_count/nrow(df)*100, '%', '\n')

#### plotting ----
ggplot(df, aes(x=sleep, y=has_depression, fill=has_depression)) +
  stat_halfeye(.width=c(0.9, 0.5), color='darkred',scale=0.5) +
  geom_boxplot(
    width = 0.12,
    outlier.color = NA,
    alpha = 0.5
  ) +
  stat_dots(
    side = "left",
    justification = 1.1,
    binwidth = 0.1
  ) +
  labs(
    title = 'Sleep by Depression Stauts',
    x = 'Average Sleep (hours)',
  ) +
  xlim(0,1)+
  scale_y_discrete(expand = expansion(mult = c(0.5, 0.5))) +
  scale_fill_manual(values = c('skyblue2', 'purple1')) +
  theme_minimal() +
  theme(axis.ticks.y = element_blank(), axis.text.y = element_blank())