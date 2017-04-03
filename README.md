# GettingAndCleaningData
Coursera Getting and Cleaning Data Course Project

The run_analysis.R script creates a tidy dataset from the data provided by the UCI Machine Learning Repository, which can be found here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The following is a description of the data from the website:

Data Set Information:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six       activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the   waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a           constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly         partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding     windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion         components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to   have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was   obtained by calculating variables from the time and frequency domain.

The run_analysis.R script merges the test and training datasets, names the variables appropriately, labels each of the activities performed by the volunteers (subjects), and keeps only the information on the mean and standard deviation of the signals recorded. The script then creates a second dataset which creates an average for each of the variables by activity and subject. This second dataset is called tidy_dataset and can be found in this repository. More information on the variables can be found in Codebook.
