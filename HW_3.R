# R course for beginners
# Week 3
# assignment by Amir Mano, id 205779788

#### load data ----

# import packages
library(tidyverse)
library(ggplot2)
library(ggdist)

# prepare workspace
rm(list = ls()) #or Ctrl + Shift + F10 & Ctrl + L
df <- read.csv('HW_2.csv')

#### print descriptive statistics ----
df |> 
  filter(age > 18) |>
  group_by(sex) |> 
  summarise(n(), mean(iq), mean(age), mean(has_depression))

df |> 
  filter(age <= 18) |>
  group_by(sex) |> 
  summarise(n(), mean(iq), mean(age), mean(has_depression))

#### create plots for IQ values ----
library(patchwork)
plot1 <- 
  ggplot(df, aes(x=iq))+
  geom_histogram(binwidth = 5, color = 'red4',fill='steelblue3') +
  labs(title = 'IQ histogram') +
  theme_classic()

plot2 <- 
  ggplot(df, aes(x=iq))+
  geom_dotplot(color = 'red4',fill='deeppink2') +
  labs(title = 'IQ dot histogram') +
  theme_classic()

plot3 <-
  ggplot(df, aes(x=iq))+
  geom_boxplot(color = 'orange4',fill='mediumseagreen') +
  labs(title = 'IQ boxplot') +
  theme_classic()

plot4 <-
  ggplot(df, aes(x=iq))+
  geom_density(color = 'saddlebrown',fill='paleturquoise2') +
  labs(title = 'IQ density') +
  theme_classic()

plot1 + plot2 + plot3 + plot4

#### create plots using ggdist  ----
# using stat
plot1 <- 
  ggplot(df, aes(x=iq))+
  stat_halfeye(
    .width=c(0.9, 0.8, 0.7),
    color = 'green3',
    fill='purple2'
    ) +
  labs(
    title = 'IQ with automated density',
    y = 'automated density'
    ) +
  theme_classic()

# using geom
y <- dnorm(df$iq, mean=100, sd = 15) # choose parameters from original setting and not specific to the data
df <- df |> mutate(y=y)
plot2 <- 
  ggplot(df, aes(x=iq,y=y))+
  geom_area(
    fill = 'green3'
  ) +
  labs(
    title = 'IQ with calculated density',
    y = 'calculated density'
  ) +
  theme_classic() #can be used with geom_slab() after using the density as 'thickness'

plot1 + plot2