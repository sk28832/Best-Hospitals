

rankhospital <- function(state, outcome, num = "best"){
        data <- read.csv("hospital-data/outcome-of-care-measures.csv", colClasses = "character")
        
        #If the state, outcome, or num is invalid, return an error message
        if(!(state %in% data$State)) stop("invalid state")
        if(!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) stop("invalid outcome")
        if(!(num == "best" | num == "worst" | is.numeric(num))) stop("invalid num")
        
        #focuses in on the desired outcome
        if(outcome == "heart attack"){
                subdata <- data.frame(State = data$State, Hospital = data$Hospital.Name, MortalityRate = as.numeric(data[,11]))
        }
        else if(outcome == "heart failure"){
                subdata <- data.frame(State = data$State, Hospital = data$Hospital.Name, MortalityRate = as.numeric(data[,17]))
        }
        else{
                subdata <- data.frame(State = data$State, Hospital = data$Hospital.Name, MortalityRate = as.numeric(data[,23]))
        }
        
        #look at the entries for the desired state, sort the entries, and add ranking
        state_subdata <- subset(subdata, data$State == state)
        sorted_state_subdata <- state_subdata[order(state_subdata$MortalityRate, state_subdata$Hospital),]
        sorted_state_subdata_ranking <- data.frame(sorted_state_subdata, Ranking = 1:nrow(sorted_state_subdata))
        
        #remove all NA values for mortality rating
        sorted_state_subdata_ranking <- na.omit(sorted_state_subdata_ranking)
        #if num is too big or not positive, return NA
        if(is.numeric(num) & (num > nrow(sorted_state_subdata_ranking) | num < 1)) return(NA)
        
        #return the hospital corresponding to the inputted ranking
        if(num == "best") return(sorted_state_subdata_ranking[1,2])
        else if(num == "worst"){
                wanted_entry <- subset(sorted_state_subdata_ranking, Ranking == nrow(sorted_state_subdata_ranking))
                return(wanted_entry[1,2])
        }
        else{
                wanted_entry <- subset(sorted_state_subdata_ranking, Ranking == num)
                return(wanted_entry[1,2])
        }
        
}