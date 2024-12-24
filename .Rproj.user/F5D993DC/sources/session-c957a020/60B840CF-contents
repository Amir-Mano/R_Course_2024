# R course for beginners
# Week 6 part 2
# assignment by Amir Mano, id 205779788

#### prepare workspace ----
rm(list = ls()) #or Ctrl + Shift + F10 & Ctrl + L
load('HW_6_1.RData')

# import packages
library(tidyverse)
library(ggplot2)
library(patchwork)
library(ggpubr)

#### descriptive statistics ----
cat('Age statistics:\n', summary(df)[c(1,6,4,3) ,2],'\n')
cat('Female numbers:\n', df$sub_id[df$gender=='F'],'\n')
cat('Male numbers:\n', df$sub_id[df$gender=='M'],'\n')

#### plotting ----
# with R based
plot(df$stress,df$satisfaction, ylim= c(0,100),
     xlab = 'Stress Level', ylab = 'Satisfaction Score')
title('with R based')
abline(lm(df$satisfaction ~ df$stress), col = "red")
plot1 <- recordPlot()

# with ggplot
plot2 <- ggplot(data = df, aes(x = stress, y = satisfaction)) +
  geom_smooth(method = "lm", color = "red3") +
  geom_point(color = "blue3", shape = 21, size = 4) +
  labs(title = "with ggplot2", 
       x = "Stress Level",
       y = "Satisfaction Score") +
  theme_classic()


plot3<- ggscatter(data = df, x = "stress", y = "satisfaction",
          color = "green4", shape = 21, size = 4,
          add = "reg.line", 
          add.params = list(color = "red3", fill = "lightgray"),
          conf.int = TRUE) +
  labs(title = "with ggscatter", 
       x = "Stress Level",
       y = "Satisfaction Score")

plot1
plot2 + plot3