#Finding the best hospital in the state for a certain condition

best <- function(state, outcome) {
        data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
        
        #If the state or outcome is invalid, return an error message
        if(!(state %in% data$State)) stop("invalid state")
        if(!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) stop("invalid outcome")
        
        #find and return the best hospital in the state for specified condition
        if(outcome == "heart attack"){
                subdata <- data.frame(State = data$State, Hospital = data$Hospital.Name, MortalityRate = as.numeric(data[,11]))
        }
        else if(outcome == "heart failure"){
                subdata <- data.frame(State = data$State, Hospital = data$Hospital.Name, MortalityRate = as.numeric(data[,17]))
        }
        else{
                subdata <- data.frame(State = data$State, Hospital = data$Hospital.Name, MortalityRate = as.numeric(data[,23]))
        }
        #look at the entries for a certain state, sort the entries, and return the one with the lowest mortality
        state_subdata <- subset(subdata, subdata$State == state)
        sorted_state_subdata <- state_subdata[order(state_subdata$MortalityRate),]
        return(sorted_state_subdata[1,2])
}