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

Saved as an additional file - "Results - C2.md"


**C.3:**

created 2 graphs for Linear models (model1/model2, model1/model3), were saved to "Linear_Models_plotting.pdf"
created 2 graphs for Logistic models (Wind - models1-4, Keyboard - models1-4), were saved to "Logistic_Models_plotting.pdf"


**C.4:**

created 2 graphs (Wind - models1-4, Keyboard - models1-4), were saved to "ROC_plotting.pdf"

