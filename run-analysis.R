## This script prepares data collected from the accelerometers from the Samsung Galaxy
## S smartphone. For full description of the data see
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
##
## Goals:
##    1. Merge the training and test sets to create one data set
##    2. Extract only the measurments on the mean and standard deviation
##    3. Use descriptive activity names
##    4. Use descriptive variable names
##    5. Create new, independent tidy data set with average of each variable for each
##      activity and subject

run_analysis <- function() {
    ## Load needed libraries
    library(dplyr)

    ## Download data and create needed data structure
    ##
    ## Args: None
    ## Return: Path to the downloaded folder
    download_data <- function() {
        url = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        print(paste("Downloading data files from", url, "..."))

        if(file.exists("./data")) {
            print("... Skipped!")
        } else {
            dir.create("./data")
            download.file(url, destfile="./data/Dataset.zip", method="curl")
            print("Done!")
            print("Extracting downloaded files into './data' directory...")
            unzip(zipfile="./data/Dataset.zip", exdir="./data")
            print("Done!")
            print("Cleaning up...")
            file.remove("./data/Dataset.zip")
            print("Done!")
        }

        file.path("./data/UCI HAR Dataset")
    }

    ## Merge train and test data sets
    ## Args: path = Path to directory containing data files
    ## Return: Data frame containing test and training data
    merge_data <- function(path) {
        print("Merging data files...")

        print("... Merging subject data files...")
        data_subject <- rbind(
            read.table(paste(path, "test/subject_test.txt", sep = "/"), header = FALSE, col.names = "subject"),
            read.table(paste(path, "train/subject_train.txt", sep = "/"), header = FALSE, col.names = "subject")
        )
        print("... Done!")

        print("... Merging feature data files...")
        ## read feature names from features data set
        features <- read.table(paste(path, "features.txt", sep = "/"), header = FALSE)

        data_x <- rbind(
            read.table(paste(path, "test/X_test.txt", sep = "/"), header = FALSE, col.names = features[, 2]),
            read.table(paste(path, "train/X_train.txt", sep = "/"), header = FALSE, col.names = features[, 2])
        )
        ## select only measurments on the mean and standard deviation
        data_x <- select(data_x, grep("(\\.mean\\.|\\.std\\.)", names(data_x)))
        print("... Done!")

        print("... Merging label data files...")
        data_y <- rbind(
            read.table(paste(path, "test/y_test.txt", sep = "/"), header = FALSE, col.names = "activity"),
            read.table(paste(path, "train/y_train.txt", sep = "/"), header = FALSE, col.names = "activity")
        )
        print("... Done!")

        print("Done!")
        tbl_df(cbind(data_subject, data_y, data_x))
    }

    ## Create tidy variable names
    ## Args: df = Data frame with original variable names
    ## Return: Vector of tidy variable names
    tidy_variable_names <- function(df) {
        print("Creating tidy variable names...")
        tidy_names <- gsub("\\W+", "", names(df))
        tidy_names <- tolower(tidy_names)
        tidy_names <- gsub("^t", "time", tidy_names)
        tidy_names <- gsub("^f", "frequency", tidy_names)
        tidy_names <- gsub("acc", "accelerometer", tidy_names)
        tidy_names <- gsub("gyro", "gyroscope", tidy_names)
        tidy_names <- gsub("mag", "magnitude", tidy_names)
        print("Done!")
        gsub("bodybody", "body", tidy_names)
    }

    path <- download_data()
    merged_data <- merge_data(path)

    ## Use descriptive activity names
    print("Reading and setting activity labels...")
    labels <- read.table(
        paste(path, "activity_labels.txt", sep="/"),
        header = FALSE, col.names = c("id", "label")
    )
    merged_data <- mutate(merged_data, activity = tolower(labels$label[activity]))
    print("Done!")

    ## Use descriptive variable names
    names(merged_data) <- tidy_variable_names(merged_data)

    ## Create independent data set grouped by subject and activity with mean for each
    ## variable
    print("Creating summarized data table...")
    summarized_data <- merged_data %>%
        group_by(subject, activity) %>%
        summarize_each(funs(mean))
    print("Done!")

    ## Write summarized data into file
    print("Writing summarized data into './data/summarized-data.txt'")
    write.table(summarized_data, file = "./data/summarized-data.txt", row.name = FALSE)
    print("Done!")

    ## Return summarized data
    summarized_data
}
