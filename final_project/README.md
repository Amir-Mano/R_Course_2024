# Final Project - Amir Mano #
*Using behavioral data from my PhD*

### About The Dataset ###
The data includes 161 musicians that were scanned in the MRI and some information about their musical habits:
- Main instrument
- The group of the main instrument (6 unique values)
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

created 3 graphs, were saved to "exploratory_plotting.pdf"

**A.3:**
Main question:
Is the age in which the individual started his musical journey (a.k.a Age-of-Onset - AoO) affects his practice routine?

Further questions:
If there is an effect - does this effect depends on the kind of instrument the individual is playing?

**B.1:**

### TODO ###
- Linear regression to see if there is a connection between practice and AoO.
- Logistic regression to see if there is a connection between weekly practice alone and Wind (or Keyboard) playing.
- Logistic regression to see if there is a connection between weekly practice, AoO, and Wind (or Keyboard) playing.

*make sure to remove Null data