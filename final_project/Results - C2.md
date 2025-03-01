# Results (Question C.2) #
*Model explanations*

## Linear regression ##

**model1: AoO = 9.97545 − 0.06725 × Practice**

The Intercept (9.97545) represents the estimated AoO for a participant with zero hours of practice.
The Practice coefficient (-0.06725) suggests that for each additional hour of practice per week, the AoO decreases by 0.067 years on average.
This negative relationship suggests that individuals who started practicing at a younger age tend to practice more.

**model2: AoO = 9.37515 - 0.06457 X Practice + 1.23518 X is_wind**

The Intercept (9.37515) represents the estimated AoO for non-wind players with zero practice hours.
The Practice coefficient (-0.06457) remains similar to Model 1, indicating small reduction in the strength of the effect when accounting for instrument group.
The is_wind coefficient (1.23518) suggests that wind instrument players start on average 1.235 years later than non-wind players, when controlling for practice.

**model3: AoO = 10.01778 - 0.06672 X Practice - 0.45409 X is_keyboard**

The Intercept (10.01778) represents the estimated AoO for non-keyboard players with zero practice hours.
The Practice coefficient (-0.06672) remains similar to previous models, indicating a consistent negative relationship between practice and AoO.
The is_keyboard coefficient (-0.45409) suggests that keyboard players start, on average, 0.45 years earlier than non-keyboard players. This can be inferred from comparing this intercept to previous ones.

**model4: AoO = 9.33754 - 0.06471 X Practice + 1.27462 X is_wind + 0.19787 X is_keyboard**

The Intercept (9.33754) represents the estimated AoO for non-wind and non-keyboard players with zero practice hours.
The Practice coefficient (-0.06471) remains negative, showing that practice is still associated with an earlier AoO.
The is_wind coefficient (1.27462) confirms that wind players tend to start approximately 1.27 years later than non-wind players, consistent with Model 2.
The is_keyboard coefficient (0.19787) suggests that keyboard players tend to start slightly later than non-keyboard players.

**Conclusions**

The strongest predictor of AoO is Practice, with a negative relationship across all models.
Adding instrument group variables (is_wind, is_keyboard) changes the intercept and slightly affects the Practice coefficient, indicating that instrument type contributes to AoO variance.


## Logistic regression ##
### Logistic regression - Wind ###

**model1: log-odds = -0.384**

The intercept (-0.384) represents the log-odds of being a wind player when no predictors are included.
The results is p = 0.41, meaning that without considering any variables, the estimated probability of a musician being a wind player is ~41%.

**model2: log-odds = -0.32997 - 0.00429 × Practice**

The intercept (-0.32997) represents the log-odds of being a wind player when practice is 0.
The Practice coefficient (-0.00429) suggests that each additional hour of practice slightly decreases the odds of being a wind player, though the effect is very small.

**model3 (same sample of model4): log-odds = -0.05540 - 0.00880 × Practice**
The intercept (-0.05540) is closer to 0, meaning the baseline probability of being a wind player is higher in this subset.
The Practice coefficient (-0.00880) is slightly similar.

**model4: log-odds = -1.04549 - 0.00215 × Practice + 0.09938 × AoO**

The Practice coefficient (-0.00215) is even smaller, meaning that after accounting for AoO, practice has small additional impact.
The AoO coefficient (0.09938) suggests that for each additional year of AoO, the odds of being a wind player increase.
This suggests that starting music at a later age increases the likelihood of being a wind player.




### Logistic Regression - Keyboards ###

**model1: log-odds = -1.833**

The intercept (-1.833) represents the log-odds of being a keyboard player when no predictors are included.
The result is p = 0.14, meaning that without considering any variables, the estimated probability of a musician being a keyboard player is ~14%.

**model2: log-odds = -1.58846 - 0.02067 × Practice**

The intercept (-1.58846) represents the log-odds of being a keyboard player when practice is 0.
The Practice coefficient (-0.02067) suggests that each additional hour of practice per week decreases the odds of being a keyboard player.

**model3 (same sample of model4): log-odds = -2.2642 + 0.0117 × Practice**

The intercept (-2.2642) is lower than in previous models, suggesting a lower baseline probability of being a keyboard player in this subset.
The Practice coefficient (+0.0117) has changed direction, meaning that here, more practice is slightly associated with a higher likelihood of being a keyboard player.

**model4: log-odds = -1.89516 + 0.00929 × Practice - 0.03791 × AoO**

The Practice coefficient (+0.00929) remains positive, reinforcing the idea that practice might be slightly associated with higher odds of being a keyboard player.
The AoO coefficient (-0.03791) suggests that for each additional year of AoO, the odds of being a keyboard player decrease.
This model suggests that keyboard players tend to start playing music at an earlier age compared to others.

**Conclusions**

Wind players tend to start later than other musicians, while Keyboards players tend to start earlier.
Practice has only a small impact on predicting Wind players, and mixed results when predicting Keyboards players.
