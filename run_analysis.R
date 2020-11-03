library(dplyr)
library(tidyverse)
library(stringr)

tPath <- "P:/MyStudy/01-Course/00-Coursera/2-DSFusingR/3-GandC Data/Project"
setwd(tPath)
# get label of features
tPath0 <- "/UCI HAR Dataset/"
f_features <- paste0(tPath, tPath0, "features.txt")
D_features <- read.table(f_features)
dim(D_features)
fix1 <- 16
fix2 <- nrow(D_features)
# Train Data #
tPath1 <- "/UCI HAR Dataset/train/"
f_train1 <- paste0(tPath, tPath1, "subject_train.txt")
f_train2 <- paste0(tPath, tPath1, "X_train.txt")
f_train3 <- paste0(tPath, tPath1, "y_train.txt")
D_train1 <- read.table(f_train1)
D_train2 <- read.fwf(f_train2, rep(fix1, fix2))
D_train3 <- read.table(f_train3, sep = " ")
colnames(D_train1)[1] <- "subject"
colnames(D_train2) <- D_features[, 2]
colnames(D_train3)[1] <- "labels"
D_train <- cbind(D_train1, D_train3)
D_train$Status <- "Train"
D_train <- cbind(D_train, D_train2)
head(D_train)
# Test Data #
tPath2 <- "/UCI HAR Dataset/test/"
f_test1 <- paste0(tPath, tPath2, "subject_test.txt")
f_test2 <- paste0(tPath, tPath2, "X_test.txt")
f_test3 <- paste0(tPath, tPath2, "y_test.txt")
D_test1 <- read.table(f_test1, sep = " ")
D_test2 <- read.fwf(f_test2, rep(fix1, fix2))
D_test3 <- read.table(f_test3, sep = " ")
colnames(D_test1)[1] <- "subject"
colnames(D_test2) <- D_features[, 2]
colnames(D_test3)[1] <- "labels"
D_test <- cbind(D_test1, D_test3)
D_test$Status <- "Test"
# head(D_test)
D_test <- cbind(D_test, D_test2)
# Combine Train and Test data #
Dat <- rbind(D_train, D_test)
# dim(Dat)
Header1 <- names(Dat)




