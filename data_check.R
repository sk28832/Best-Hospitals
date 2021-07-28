#Load the data
outcome <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")

#Checking the basic parameters and values of the dataset
head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)


# Plot the 30-day mortality rates for heart attack
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[,11])