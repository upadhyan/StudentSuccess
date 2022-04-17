# Student Success Support Tool
There are many factors that will result in a student not receiving the help that they need in order to be successful as a student. We are trying to determine if we can predict which students will need extra support based on the features provided in the data set. This information is relevant because it will allow us to determine the characteristics of a student that will need support. If we can accurately determine which students will need extra support outside of the classroom, then we can have more students with higher grades.
## Data Sources
For this analysis, we intend to use the Student Performance dataset from the UCI machine learning data repository. This data set consists of two subsets: one dataset corresponds to the grades in a Portuguese course and the other a math course. Both subsets have  33 variables that relate to student demographics, parent information, schooling history, social activities, education support level, and health. Additionally, each subset has the students' grades for the respective class over three grading periods. Of the 33 variables, 28 are either binary or categorical representing the different possible situations. The other 5 variables (age, number of absences, and grades) are all numeric. 

In our analysis, the response variable is a classifier based on the final grade as well as the change in grade over the three periods. The calculation and assignment of the classes are discussed further in the methods section. The math subset has 395 observations and the Portuguese subset has 649 observations. Individual students can appear in both datasets. When these duplicates are removed there are 382 unique students in the dataset. This dataset does not contain any missing information other than that not all students exist in both classes.

## Goals
The main goal of this analysis is to identify students that are in need of extra support based on their performance throughout the school year as well as determine which factors are associated with students' success.

The team goal for this project is to assign the students to different classes in order to identify which students are in need of support. The three classes will be "critical,"  "required," and "not required" The classes will consider as many factors as possible in order to create the best match. Furthermore, the team wants to look at how important each of the factors is such that teachers and school administrators can better design support systems for students in need. We are looking to achieve a classification error below or equal to 30%. Since the majority of features are categorical or binary variables and student grades tend to have very large variance, we believe that being able to predict 70% of the variability should be sufficient for this task.

## Methods 
* First, we will create a score variable that will combine the grade the score they got in the last semester of the $$ \delta$$


Description of Methods:
First, create our score variable  S =(1+20)F  
: average change in grades between the three periods
F: the final grade of the student
Using the score, assign classes 
S7  critical
7<S14  required
14<S  not required
The value used to divide the classes were created based on the percentage value out of 20. For example, the first cutoff is at 14. The score of 14/20 equates to 70%, or a passing grade. If a student has an S-score of 14 or higher, then we can assume that they are comfortable enough to ont need any intervention. The cutoff point of 7 was chosen so that the cut off points were evenly spaced. If a student has am S-score of 7 or lower, then we can assume that it will be critical for them to receive extra support.
Split data into K-Folds 
Start out with logistic regression model
Use lasso to select best combination of variables (using K-Fold CV to determine )
Output class probability, class assignments, and feature significance.
Depending on performance, we may discard this method OR use the outputted probabilities for the next model as a feature 
Use XGBoost or LightGBM with all of the variables
Use CV to tune hyperparameters (if time permits)
Check feature importance
Trim features
Group existing features using dimensionality reduction 
At each step, evaluate runtime and CV error
