# R course for beginners
# Week 5 part 2
# assignment by Amir Mano, id 205779788

#### prepare workspace ----
rm(list = ls()) #or Ctrl + Shift + F10 & Ctrl + L
load('HW_5_1.RData')

# import packages
library(tidyverse)
library(ggplot2)
library(ggpubr)
library(patchwork)

#### descriptive statistics ----
cat('Age statistics:\n', summary(df)[c(1,6,4,3) ,2],'\n')
cat('Female numbers:\n', df$sub_id[df$gender=='F'],'\n')
cat('Male numbers:\n', df$sub_id[df$gender=='M'],'\n')

df_summary <- df |>
  group_by(group, treatment) |>
  summarise(
    mean = mean(memory_score),
    sd   = sd(memory_score)
  )
print(df_summary[,1:3])


#### plotting ----
# with ggplot
plot1 <- ggplot(df, aes(x = group, y = memory_score, color = treatment, shape=treatment)) +
  
  geom_jitter(position = position_jitter(width = 0.15, height = 5), size = 1.5, alpha = 0.3) +
  geom_point(data = df_summary, aes(x = group, y = mean, group = treatment, color = treatment), 
             position = position_dodge(1), size = 4) +
  geom_errorbar(data = df_summary,aes(x = group, y = mean, group = treatment, ymin = mean - sd, ymax = mean + sd, color = treatment), 
                position = position_dodge(1), width = 0.5) +
  
  labs(x = 'Memory Score', y = 'Group', title = 'with ggplot') +
  theme_minimal() +
  scale_color_manual(values=c("darkred", "skyblue3")) +
  theme(axis.ticks.y = element_blank(), axis.text.y = element_blank())

# with ggpubr
plot2 <- ggerrorplot(df,  x = "group",   y = "memory_score",   color = "treatment", shape="treatment", desc_stat = "mean_sd",
            add = "jitter",  add.params = list(alpha = 0.3), position = position_dodge(1)) +
  labs(x = 'Memory Score', y = 'Group', title = 'with ggpubr') +
  theme_minimal() +
  scale_color_manual(values=c("darkred", "skyblue3")) +
  theme(axis.ticks.y = element_blank(), axis.text.y = element_blank())

  plot1 + plot2



