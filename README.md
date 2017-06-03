# Getting and cleaning data course project

This repo contains R script for tidying up data from 
[Human Activity Recognition Using Smartphones Data Set](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Goals
1. Merge the training and the test sets to create one data set.
2. Extract only the measurements on the mean and standard deviation for each measurement.
3. Use descriptive activity names to name the activities in the data set
4. Appropriately label the data set with descriptive variable names.
5. From the data set in step 4, create a second, independent tidy data set with the average 
of each variable for each activity and each subject.

## How to use
1. Clone this repository: `$: git clone git@github.com:mtakac/getting-and-cleaning-data-course-project.git`
2. Start up `R` console or R IDE: `$: R`
3. Change working directory to root directory of this project: `R: setwd("/path/to/getting-and-cleaning-data-course-project")`
4. Source the `run-analysis.R` file: `R: source("./run-analysis.R")`
5. Call the function `run_analysis`: `run_analysis()`

This will return a data frame from step 5 as well as create a new file `./data/summarized-data.txt` containing data
from this data frame.

## Dependencies
Script `run-analysis.R` uses [dplyr](https://github.com/tidyverse/dplyr) library. Make sure you have the library
installed before running the script: `R: install.packages(dplyr)`

## Structure
1. `./data/UCI HAR Dataset` - Original data downloaded during the first run.
2. `./data/summarized-data.txt` - Summarized data created by `run-analysis.R` script during it's first run.
3. `./code-book.md` - Code book containing info about variables.
4. `./README.md`
5. `./run-analysis.R` - R scipt responsible for creating new summarized data frame.

## More info
- [Project site on Coursera](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project)
- [Info about experiment](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

