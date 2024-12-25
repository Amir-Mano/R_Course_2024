# R course for beginners
# Week 7 part 2
# assignment by Amir Mano, id 205779788

# Additional note for HW_8 purposes:
# This code was written by Amir Mano
# The code was written in 20/12/2024
# The code read the filtered_data file
# and then claculate descriptive statistics
# and visualize them according to the groups

#### statistics and plotting ----
load('filtered_data.rdata')
df <- df |> mutate(group = interaction(task, congureancy))

stats <- df |> 
  group_by(group) |> 
  summarize(means = mean(rt), SDs = sd(rt))


# plotting with ggplot
library(ggplot2)
ggplot(df, aes(x = group, y = rt, color = group)) +
  geom_jitter(position = position_jitter(width = 0.15, height = 5), size = 1.5, alpha = 0.3) +
  geom_point(data = stats, aes(x = group, y = means, group = group), 
             position = position_dodge(1), size = 3, color = "darkred") +
  geom_errorbar(data = stats,aes(x = group, y = means, group = group, ymin = means - SDs, ymax = means + SDs), 
                position = position_dodge(1), width = 0.5, color = 'darkred') +
  labs(x = 'Condition', y = 'Reaction Time (ms)') +
  theme_minimal()  +
  theme(axis.ticks.y = element_blank(), axis.text.y = element_blank())