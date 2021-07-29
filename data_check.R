#Load the data
outcome <- read.csv("hospital-data/outcome-of-care-measures.csv", colClasses = "character")

#Checking the basic parameters and values of the dataset
head(outcome)
ncol(outcome)
nrow(outcome)
names(outcome)


# Plot the 30-day mortality rates for heart attack
outcome[, 11] <- as.numeric(outcome[, 11])
hist(outcome[,11], main = "Mortality Rates for Heart Attack Across Hospitals in the US", xlab = "Mortality rate (%)", ylab = "Number of Hospitals")