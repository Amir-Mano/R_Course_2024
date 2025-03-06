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

**model3: AoO = 10.0768 - 0.0409 X Practice - 3.3422 X is_strings**

The Intercept (10.0768) represents the estimated AoO for non-strings players with zero practice hours.
The Practice coefficient (-0.0409) is smaller than in previous models, suggesting a slightly weaker relationship between practice and AoO of non-strings players.
The is_strings coefficient (-3.3422) suggests that strings players start 3.3 years earlier than non-strings players.

**model4: AoO = 9.82232 - 0.04197 X Practice + 0.50642 X is_wind - 3.0671 X is_strings**

The intercept (9.82232) represents the estimated AoO for musicians who are neither wind nor strings players and have zero weekly practice hours.
The practice coefficient (-0.04197) remains negative, reinforcing the idea that greater weekly practice is associated with an earlier AoO.
The is_wind coefficient (0.50642) suggests that wind players start later than other musicians, but the effect size is smaller than in Model 2.
The is_strings coefficient (-3.0671) confirms that strings players start much earlier than other musicians.

**Conclusions**

The strongest predictor of AoO is Practice, with a negative relationship across all models.
Wind players tend to start playing later than other musicians, while strings players start significantly earlier.
Adding instrument group variables (is_wind, is_strings) affects the intercepts and slightly adjusts the practice coefficient, indicating that instrument type influences AoO variation.


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




### Logistic Regression - Strings ###

**model1: log-odds = -1.907**

The intercept (-1.907) represents the log-odds of being a strings player when no predictors are included.
The result is p = 0.14, meaning that without considering any variables, the estimated probability of a musician being a strings player is ~14%.

**model2: log-odds = -2.99640 + 0.06955 × Practice**

The intercept (-2.99640) represents the log-odds of being a strings player when practice is 0.
The Practice coefficient (0.06955) suggests that each additional hour of practice per week increases the odds of being a strings player.

**model3 (same sample of model4): log-odds = -2.82905 + 0.06164 × Practice**

The intercept (-2.82905) is slightly higher than in Model 2, suggesting a different baseline probability of being a strings player in this subset.
The practice coefficient (0.06164) remains positive, reinforcing the idea that more practice is associated with increased odds of playing a string instrument.

**model4: log-odds = +1.13713 + 0.05889 × Practice -0.52902 × AoO**

The practice coefficient (0.05889) remains positive, confirming the trend that increased practice is linked to a higher likelihood of being a strings player.
The AoO coefficient (-0.52902) suggests that for each additional year of AoO, the odds of being a strings player decrease.
This model suggests that strings players tend to start playing music at an earlier age compared to others.

**Conclusions**

Wind players tend to start later than other musicians, while strings players tend to start earlier.
Practice is positively associated with being a strings player, but its effect on wind players is minimal.
AoO plays a significant role in predicting instrument group, with later AoO increasing the likelihood of wind players and decreasing the likelihood of strings players.