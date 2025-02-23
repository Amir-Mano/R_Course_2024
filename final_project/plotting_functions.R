# R course for beginners
# Final Assignment - plotting functions
# assignment by Amir Mano, id 205779788

### import libraries ----
library(tidyverse)
library(ggdist)
library(ggplot2)
#library(patchwork)

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

plot_scatter <- function(df, var_x, var_y){
  ggplot(data = df, aes(x = var_x, y = var_y)) +
    geom_smooth(method = "lm", color = "red4") +
    geom_point(color = "skyblue3", shape = 16, size = 4) +
    theme_classic()
}

plot_exploratory_to_pdf <- function(df){
  pdf(file="final_project/exploratory_plotting.pdf")
  print(
    plotting_rain(df, df$AoO) + labs (title="Age of Onset", x ="Age of Onset")
  )
  print(
    plotting_rain(df, df$practice) + labs (title="Weekly Practice", x ="Avg Weekly Practice (Hr)")
  )
  print(
    plot_scatter(df, df$practice, df$AoO)  + labs(title = "Age of Onset - Weekly practice", x = "Weekly Practice", y = "AoO")
  )
  dev.off()
}

plot_roc_curves <- function(auc_results, title_text = "") {
  colors = c("blue2", "red2", "green3", "purple")
  roc_curves <- auc_results$roc_curves
  plot(roc_curves[[1]], col = colors[1])
  for (i in 2:length(roc_curves)) {
    plot(roc_curves[[i]], add = TRUE, col = colors[i])
  }
  title(title_text)
  legend("right", legend = names(roc_curves), col = colors, lwd = 3)
}

plot_roc_to_pdf <- function(aucs1, aucs2){
  pdf(file="final_project/ROC_plotting.pdf")
  print(
    plot_roc_curves(aucs1, "ROC Curve Comparison - Wind")
  )
  print(
    plot_roc_curves(aucs2, "ROC Curve Comparison - Keyboard")
  )
  dev.off()
}
