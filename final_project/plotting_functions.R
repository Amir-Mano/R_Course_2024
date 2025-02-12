# R course for beginners
# Final Assignment - plotting functions
# assignment by Amir Mano, id 205779788

### import libraries ----
library(tidyverse)
library(ggdist)
library(patchwork)


#### functions for plotting ----
plotting_rain <- function(df, x_values){
  ggplot(df, aes(x=x_values, y=instrument_group, fill=instrument_group)) +
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
    labs(subtitle ="per group", y = "Instrument Group") +
    scale_y_discrete(expand = expansion(mult = c(0.5, 0.5))) +
    theme_minimal() +
    theme(axis.ticks.y = element_blank(), axis.text.y = element_blank())
}

plot_both_variables <- function(df){
  plot1 <- plotting_rain(df, df$AoO) + labs (title="Age of Onset", x ="Age of Onset")
  plot2 <- plotting_rain(df, df$practice) + labs (title="Weekly Practice", x ="Avg Weekly Practice (Hr)")
  plot1 + plot2
}
