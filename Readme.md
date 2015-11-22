# README.MD file
John C. McDavid, 11/22/2015

Analysis of Human Activity Using Smartphones Dataset (Version 1.0)

Analysis
This analysis averages the means and standard deviations of each recorded measurement using R code. FOr how to run the anlaysis, see "Method" below.

Process:
R code "run_analysis.R" developed to run the summary analysis on selected variables of a dataset. The code will produce a tidy data set that gives the average of each variable selected (see Data below).  This results in data for 30 subjects, 6 activity descriptions, and for each of 66 features (data elements).

Experiment (data collection):
30 Volunteers of ages 19-48 were asked to perform six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a Samsung smartphone. Data were collected for each subject and activity on 561 features (data elements) using the smartphone's embedded accelerometer and gyroscope. The data was partitioned randomly into two datasets where 70% of the subjects were assigned to the tarining dataset and 30% to the test dataset.

The researchers captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.The sensor signals were pre-processed  by applying noise filtersand gravitational filters (with assumptions).  The data was normalized to (-1,1). Some data had Fast Fourier Transform applied to it. After normalization teh data is dimensionless.

Method of this Analysis:
A training and test dataset was combined into a single dataset for analysis.  The training (7352 obs) and test (2947 obs) datasets of 561 features (cols) were of identical composition (layout).

Each dataset (training, test) had corresponding datasets taht inidcated the subject number and the avtivity for each observation. The training data was column binded into a single dataset; similarly for the testdata.   This resulted in two datasets taht each had the subject number, activity number (translatable to labels), and 561 features in them.

Next, the resulting training and test datasets were combined by rows.  The combined dataset was subsetted by extracting selected features for summary analysis.  The features selected for summary analysis were all teh mean and standard deviation measurement variables. There were 33 mean and 33 std dev variables.  Derivative mean and std dev variables are a different measurement variable and are not used in this dataset.
See CodeBook for descriptions of teh data and data processing.

<The following from original document>
License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.