# Final Project - Amir Mano #
*Using behavioral data from my PhD*

### About The Dataset ###
The data includes 161 musicians that were scanned in the MRI and some information about their musical habits:
- Main instrument
- Average weekly practice in that instrument
- The age at which they started to play this instrument (AoO - Age of Onset).

### Open Questions ###
**A.1:**

This dataset was collected for my PhD research. 
In my research, I will compare musicians' brains based on their main instrument using a multimodal MRI approach. 
Apart from the MRI data, I collected some behavioral data that is relevant to the engagement in music of each of the subjects. 
As each instrument has its unique demands, I believe that the main instrument may affect the engagement in music. 
As it is not a direct part of my study, I found it interesting to look for this assumption during the Final Assignment in the R course.  


**A.2:**

In order to have meaningful exploration, I first divided the instruments to groups (6 in total).
created 3 graphs, were saved to "exploratory_plotting.pdf"


**A.3:**

Main Question:
Is the age in which the individual started his musical journey (a.k.a Age-of-Onset - AoO) affects his practice routine?

Further Questions:
If there is an effect - does this effect depends on the kind of instrument the individual is playing?


**B.1:**

To answer the question in A.3, we will need the variables: "instrument_group", "practice", "AoO".
As "instrument_group" has 6 levels, and as they are not equally represented, I will relate to this variable as binary - 
by choosing a group (for example, the "wind" group, as it is the biggest), and compare those who are in this group and those who are not.


**B.2:**

To process the data, I build functions that appear in the file "data_processing_functions", to create the variable needed that mentioned in B.1.
I chose not to remove variable without AoO, because some of the planned analysis won't use it, and for those I prefer to include subjects without AoO values.


**B.3:**

All plotting and data-processing processes were made using functions that I created.


**B.4:**

Using the library "digest" in order to anonymize the subjects' ids, and to make the ids continuous after removing irrelevant rows.


**C.1:**

**Linear regression** - building 4 models in order to look at the connection between practice and AoO.
model1 - outcome: "AoO", predictors: "practice". To answer the "Main Question".
model2/3 - outcome: "AoO", predictors: "practice", "is_wind"/"is_keyboard". To check whether adding the instrument group, can contribute to the model (""Further Questions").
model4 - outcome: "AoO", predictors: "practice", "is_wind", "is_keyboard". combining all variables.

**Logistic regression** - building 4 models for each outcome ("is_wind"/"is_keyboard")  in order to further understand the connection between an instrument, practice, and AoO.
model1 - without predictors. Null model, to define baseline.
model2 - predictors: "practice". To check whether practice alone can predict the instrument group.
model3 - predictors: "practice". smaller data sample to compare with model4.
model4 - predictors: "practice", "AoO". Adding AoO to check its contribution to the prediction. smaller data sample as some AoO values are missing. 

**C.2:**

**Linear regression**

model1: AoO = 9.97545 − 0.06725 × Practice

The Intercept (9.97545) represents the estimated AoO for a participant with zero hours of practice.
The Practice coefficient (-0.06725) suggests that for each additional hour of practice per week, the AoO decreases by 0.067 years on average.
This negative relationship suggests that individuals who started practicing at a younger age tend to practice more.

model2: AoO = 9.37515 - 0.06457 X Practice + 1.23518 X is_wind

The Intercept (9.37515) represents the estimated AoO for non-wind players with zero practice hours.
The Practice coefficient (-0.06457) remains similar to Model 1, indicating small reduction in the strength of the effect when accounting for instrument group.
The is_wind coefficient (1.23518) suggests that wind instrument players start on average 1.235 years later than non-wind players, when controlling for practice.

model3: AoO = 10.01778 - 0.06672 X Practice - 0.45409 X is_keyboard

The Intercept (10.01778) represents the estimated AoO for non-keyboard players with zero practice hours.
The Practice coefficient (-0.06672) remains similar to previous models, indicating a consistent negative relationship between practice and AoO.
The is_keyboard coefficient (-0.45409) suggests that keyboard players start, on average, 0.45 years earlier than non-keyboard players. This can be inferred from comparing this intercept to previous ones.

model4: AoO = 9.33754 - 0.06471 X Practice + 1.27462 X is_wind + 0.19787 X is_keyboard

The Intercept (9.33754) represents the estimated AoO for non-wind and non-keyboard players with zero practice hours.
The Practice coefficient (-0.06471) remains negative, showing that practice is still associated with an earlier AoO.
The is_wind coefficient (1.27462) confirms that wind players tend to start approximately 1.27 years later than non-wind players, consistent with Model 2.
The is_keyboard coefficient (0.19787) suggests that keyboard players tend to start slightly later than non-keyboard players.


The strongest predictor of AoO is Practice, with a negative relationship across all models.
Adding instrument group variables (is_wind, is_keyboard) changes the intercept and slightly affects the Practice coefficient, indicating that instrument type contributes to AoO variance.



**Logistic regression - Wind**

model1: log-odds = -0.384

The intercept (-0.384) represents the log-odds of being a wind player when no predictors are included.
The results is p = 0.41, meaning that without considering any variables, the estimated probability of a musician being a wind player is ~41%.

model2: log-odds = -0.32997 - 0.00429 × Practice

The intercept (-0.32997) represents the log-odds of being a wind player when practice is 0.
The Practice coefficient (-0.00429) suggests that each additional hour of practice slightly decreases the odds of being a wind player, though the effect is very small.

model3 (same sample of model4): log-odds = -0.05540 - 0.00880 × Practice
The intercept (-0.05540) is closer to 0, meaning the baseline probability of being a wind player is higher in this subset.
The Practice coefficient (-0.00880) is slightly similar.

model4: log-odds = -1.04549 - 0.00215 × Practice + 0.09938 × AoO

The Practice coefficient (-0.00215) is even smaller, meaning that after accounting for AoO, practice has small additional impact.
The AoO coefficient (0.09938) suggests that for each additional year of AoO, the odds of being a wind player increase.
This suggests that starting music at a later age increases the likelihood of being a wind player.


**Logistic Regression - Keyboards**

model1:
Log-odds = -1.833

The intercept (-1.833) represents the log-odds of being a keyboard player when no predictors are included.
The result is p = 0.14, meaning that without considering any variables, the estimated probability of a musician being a keyboard player is ~14%.

model2: log-odds = -1.58846 - 0.02067 × Practice

The intercept (-1.58846) represents the log-odds of being a keyboard player when practice is 0.
The Practice coefficient (-0.02067) suggests that each additional hour of practice per week decreases the odds of being a keyboard player.

model3 (same sample of model4): log-odds = -2.2642 + 0.0117 × Practice

The intercept (-2.2642) is lower than in previous models, suggesting a lower baseline probability of being a keyboard player in this subset.
The Practice coefficient (+0.0117) has changed direction, meaning that here, more practice is slightly associated with a higher likelihood of being a keyboard player.

model4: log-odds = -1.89516 + 0.00929 × Practice - 0.03791 × AoO

The Practice coefficient (+0.00929) remains positive, reinforcing the idea that practice might be slightly associated with higher odds of being a keyboard player.
The AoO coefficient (-0.03791) suggests that for each additional year of AoO, the odds of being a keyboard player decrease.
This model suggests that keyboard players tend to start playing music at an earlier age compared to others.


Wind players tend to start later than other musicians, while Keyboards players tend to start earlier.
Practice has only a small impact on predicting Wind players, and mixed results when predicting Keyboards players.


**C.3:**


**C.4:**

created 2 graphs, were saved to "ROC_plotting.pdf"

