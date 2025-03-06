# R course for beginners
# Final Assignment - plotting functions
# assignment by Amir Mano, id 205779788

### import libraries ----
library(tidyverse)
library(ggdist)
library(ggplot2)

#### functions for plotting exploratory ----
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


#### functions for plotting models ----
plot_linear_models <- function(df, group_var) {
  model_label <- ifelse(group_var == "is_wind", "Model 2 - Wind", "Model 3 - Strings")
  
  ggplot(df, aes(x = practice, y = AoO)) +
    geom_point(aes(color = factor(df[[group_var]])), alpha = 0.6) +
    geom_smooth(aes(color = factor(df[[group_var]])), method = "lm", se = FALSE) +
    geom_smooth(aes(color = "Model 1 - Overall Trend"), method = "lm", linetype = "dashed", se = FALSE) +
    scale_color_manual(values = c("Model 1 - Overall Trend" = "black", "0" = "skyblue2", "1" = "red4"),
                       labels = c("Model 1 - Overall Trend", "0" = paste(model_label, "- False"), "1" = paste(model_label, "- True"))) +
    labs(title = paste("Linear Models for", ifelse(group_var == "is_wind", "Wind Players", "Strings Players")),
         x = "Weekly Practice Hours",
         y = "Age of Onset (AoO)",
         color = "Model") +
    theme_minimal()
}

plot_linear_models_to_pdf <- function(df){
  pdf(file="final_project/Linear_Models_plotting.pdf")
  print(
    plot_linear_models(df, "is_wind")
  )
  print(
    plot_linear_models(df, "is_strings")
  )
  dev.off()
}

plot_logistic_models <- function(df, models, group_name) {
  practice_seq <- seq(min(df$practice), max(df$practice), length.out = 100)
  pred_data <- data.frame(practice = practice_seq, AoO = mean(df$AoO, na.rm = TRUE))  # Use mean AoO for models that need it
  
  pred_data$model1_prob <- predict(models$model1, newdata = pred_data, type = "response")
  pred_data$model2_prob <- predict(models$model2, newdata = pred_data, type = "response")
  pred_data$model3_prob <- predict(models$model3, newdata = pred_data, type = "response")
  pred_data$model4_prob <- predict(models$model4, newdata = pred_data, type = "response")
  
  ggplot(df, aes(x = practice, y = as.numeric(df[[group_name]]))) +
    geom_point(alpha = 0.5, color = "gray") +
    
    geom_line(data = pred_data, aes(x = practice, y = model1_prob, color = "Model 1 - Intercept Only"), linetype = "dashed", size = 1.2) +
    geom_line(data = pred_data, aes(x = practice, y = model2_prob, color = "Model 2 - Practice"), size = 1.2) +
    geom_line(data = pred_data, aes(x = practice, y = model3_prob, color = "Model 3 - Practice - subset"), size = 1.2) +
    geom_line(data = pred_data, aes(x = practice, y = model4_prob, color = "Model 4 - Practice + AoO"), size = 1.2) +
    
    scale_color_manual(
      values = c("Model 1 - Intercept Only" = "black",
                 "Model 2 - Practice" = "palegreen",
                 "Model 3 - Practice - subset" = "palegreen3",
                 "Model 4 - Practice + AoO" = "palegreen4"),
      labels = c("Model 1 - Intercept Only",
                 "Model 2 - Practice",
                 "Model 3 - Practice - subset",
                 "Model 4 - Practice + AoO")
    ) +
    labs(title = paste("Logistic Regression Models for", group_name, "Players"),
         x = "Weekly Practice Hours",
         y = paste("Probability of Being a", group_name, "Player"),
         color = "Model") +
    theme_minimal()
}

plot_logistic_models_to_pdf <- function(df, models_wind, models_strings){
  pdf(file="final_project/Logistic_Models_plotting.pdf")
  print(
    plot_logistic_models(df, models_wind, "is_wind")
  )
  print(
    plot_logistic_models(df, models_strings, "is_strings")
  )
  dev.off()
}

#### functions for plotting ROC ----
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
    plot_roc_curves(aucs2, "ROC Curve Comparison - Strings")
  )
  dev.off()
}

