# Script configuration
dataPath <- file.path(getwd(), "getdata-projectfiles-UCI HAR Dataset", "UCI HAR Dataset")

# Reads the X data files into R and modifies the column names and extracts just
# the mean and standard deviation columns.
readX <- function() {
  print("Reading X...")
  
  trainFile <- read.table(file.path(dataPath, "train", "X_train.txt"))
  testFile <- read.table(file.path(dataPath, "test", "X_test.txt"))
  X <- rbind(trainFile, testFile)
  
  features <- read.table(file.path(dataPath, "features.txt"))
  meanOrStdFeatures <- grep("-mean\\(\\)|-std\\(\\)", features[, 2])
  X <- X[, meanOrStdFeatures]
  names(X) <- features[meanOrStdFeatures, 2]
  names(X) <- gsub("\\(|\\)", "", names(X))
  names(X) <- gsub("-", ".", names(X))
  names(X) <- tolower(names(X))
  
  X
}

# Reads the Y data files into R and uses descriptive activity names
readY <- function() {
  print("Reading Y...")
  
  trainFile <- read.table(file.path(dataPath, "train", "y_train.txt"))
  testFile <- read.table(file.path(dataPath, "test", "y_test.txt"))
  Y <- rbind(trainFile, testFile)  
  
  activityLabels <- read.table(file.path(dataPath, "activity_labels.txt"))
  activityLabels[, 2] <- gsub("_", " ", activityLabels[, 2])
  activityLabels[, 2] <- tolower(activityLabels[, 2])
  
  Y[,1] = activityLabels[Y[,1], 2]
  
  names(Y) <- "activity"
  
  Y
}

# Reads the subject data files into R and renames the column
readSubject <- function() {
  print("Reading Subject...")
  
  trainFile <- read.table(file.path(dataPath, "train", "subject_train.txt"))
  testFile <- read.table(file.path(dataPath, "test", "subject_test.txt"))
  subject <- rbind(trainFile, testFile)  

  names(subject) <- "subject"
  
  subject
}

# Reads Xs, Ys and subjects into R using the functions above and combine them 
# into a tidy data set
readData <- function() {
  X <- readX()
  Y <- readY()
  subject <- readSubject()
  
  tidy <- cbind(subject, Y, X)
  
  tidy
}

# Output the tidy data to a file
writeTidy <- function(tidy) {
  write.table(tidy, "tidy.txt")  
}

# Generate and output averages to a file
writeAverages <- function(tidy) {
  library(data.table)
  
  dtTidy <- data.table(tidy)
  
  averages <- dtTidy[, lapply(.SD, mean), by=c("subject", "activity")]
  averages <- averages[order(averages$subject, averages$activity),]  
  
  write.table(averages, "averages.txt")   
}


# "Wires" the functions above together. Function to run to run the whole 
# process.
run <- function() {
  combined <- readData()
  
  print("Outputting results...")
  writeTidy(combined)
  writeAverages(combined)
  
  print("Done!")
}

