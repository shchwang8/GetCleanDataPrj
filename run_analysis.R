library(dplyr)
library(tidyverse)
library(stringr)
tPath <- "C:/Project"
setwd(tPath)
# get the feature names and the active labels #
tPath0 <- "/UCI HAR Dataset/"
f_features <- paste0(tPath, tPath0, "features.txt")
D_features <- read.table(f_features)
f_label <- paste0(tPath, tPath0, "activity_labels.txt")
D_label <- read.table(f_label)
# get the fixed format data (X)'s width and number
fix1 <- 16
fix2 <- nrow(D_features)
# Read in Train Data - subject, y, and X #
tPath1 <- "/UCI HAR Dataset/train/"
f_train1 <- paste0(tPath, tPath1, "subject_train.txt")
f_train2 <- paste0(tPath, tPath1, "X_train.txt")
f_train3 <- paste0(tPath, tPath1, "y_train.txt")
D_train1 <- read.table(f_train1)
D_train2 <- read.fwf(f_train2, rep(fix1, fix2))
D_train3 <- read.table(f_train3, sep = " ")
# combine "Subject", "Active_Label", and "Train Set"
D_train <- cbind(D_train1, D_train3)
D_train <- cbind(D_train, D_train2)
head(D_train)
# Read in Test Data #
tPath2 <- "/UCI HAR Dataset/test/"
f_test1 <- paste0(tPath, tPath2, "subject_test.txt")
f_test2 <- paste0(tPath, tPath2, "X_test.txt")
f_test3 <- paste0(tPath, tPath2, "y_test.txt")
D_test1 <- read.table(f_test1, sep = " ")
D_test2 <- read.fwf(f_test2, rep(fix1, fix2))
D_test3 <- read.table(f_test3, sep = " ")
# combine "Subject", "Active_Label", and "Test Set"
D_test <- cbind(D_test1, D_test3)
D_test <- cbind(D_test, D_test2)
# 1.	Merges the training and the test sets to create one data set. #
Dat <- rbind(D_train, D_test)
# 4. Appropriately labels the data set with descriptive variable names. #
colnames(Dat) <- c("subject", "Active_labels",D_features[, 2])
# 2.	Extracts only the measurements on the mean and standard deviation for each measurement. #
idx0 <- c(1:2)
idx1 <- grep("mean()", Header1, fixed = TRUE)
idx2 <- grep("std()", Header1, fixed = TRUE)
idx <- c(idx0, idx1, idx2)
Header2 <-Header1[idx]
Dat <- Dat[, Header2]
# 3.	Uses descriptive activity names to name the activities in the data set #
D_label.code <- D_label[, 1]
D_label.str <- D_label[, 2]
Dat$activity_labels <- D_label.str[match(Dat$Active_labels, D_label.code)]
M <- ncol(Dat)
Dat <- Dat[, c(1, M, 3:(M-1))]
# output the data after finishing step 1. 2. 3. and 4. 
fnm <- "CombinedTrainTestData.txt"
write.table(Dat, fnm, quote = FALSE, sep = "\t", row.names = FALSE)
# 5.	From the data set in step 4, creates a second, independent tidy data set #
#     with the average of each variable for each activity and each subject. #
M <- ncol(Dat)
Dat3 <- Dat %>% 
  group_by(subject, activity_labels) %>%
  summarise_all("mean")
fnm <- "Neat_meanSubjectActivityData.txt"
write.table(Dat3, fnm, quote = FALSE, sep = "\t", row.names = FALSE)
