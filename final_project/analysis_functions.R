# R course for beginners
# Final Assignment - analysis functions
# assignment by Amir Mano, id 205779788

# import libraries and functions
source("final_project/data_processing_functions.R")

linear_regression <- function(df, outcome, predictors){
  df <- remove_nans(df, df$AoO)
  formula <- as.formula(paste(outcome, "~", paste(predictors, collapse = " + ")))
  model <- lm(formula, data = df)
  return(summary(model))
}

logistic_regression <- function(df, outcome, predictors = NULL){
  if (is.null(predictors) || length(predictors) == 0) {
    formula <- as.formula(paste(outcome, "~ 1"))
  }
  else {
    formula <- as.formula(paste(outcome, "~", paste(predictors, collapse = " + ")))
  }
  
  model <- glm(formula, data = df, family = binomial())
  return(summary(model))
}

multiple_logistic_regressions <- function(df, column){
  model1 <- logistic_regression(df, column)
  model2 <- logistic_regression(df, column, c("practice"))
  
  df <- remove_nans(df, df$AoO)
  
  model3 <- logistic_regression(df, column, c("practice")) #re-check over smaller data-set to compare with model4
  model4 <- logistic_regression(df, column, c("practice", "AoO"))
  
  return(list(model1 = model1, model2 = model2, model3 = model3, model4 = model4))
}

