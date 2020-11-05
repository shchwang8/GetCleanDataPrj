# Getting Cleaning Data Project
Final project of Cousera course "Getting and Cleaning Data"

R script "run_analysis.R" description

The original data is under folder "UCI HAR Dataset"
File "CodeBook.md" describes the variables and contents of the neat dataset in file "Neat_meanSubjectActivityData.txt"

The R Script:

A. Prepare Data

	1. Read in "features.txt" and "activity_labels.txt" files
	
	2. Read in train datasets
   		"subject_train.txt", "X_train.txt", and "y_train.txt"
   		"X_train.txt" is a file with fixed width format.
   		fix1 is the width (16)
   		The value stored in fix2 is equal to the number of lines in the file "features.txt"
   		
	3. Read in test datasets in the same way
	
	4. Column combination of trait datasets (Subject, y, and X)
	
	5. Column combination of test datasets (Subject, y, and X)
	
B. Project assignment

	1. Merges the training and the test sets to create one data set.
	 	Row combination of train and test dataset
		Assign appropriate labels to dataset
		
	2. Extracts only the measurements on the mean and standard deviation for each measurement.
		Assign all mean variable names to "idx1" and standard deviation variable names to "idx2"
		Extracts only mean and standard deviation columns
		
	3. Uses descriptive activity names to name the activities in the data set
		Replace the value under the "Active_labels" column with the match from the file "activity_labels.txt"
		
	4. Appropriately labels the data set with descriptive variable names
		Make the variable names more descriptive
		Output this dataset to the file "CombinedTrainTestData.txt"
		
	5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject
		Combine rows to complete the task of building a neat data set
		Output final neat dataset to the file "Neat_meanSubjectActivityData.txt"
		
C. End of the Scrit
