rankall <- function(outcome, num = "best"){
        
        all_states <- data.frame(hospital = character(50), state = state.abb)
        for(x in 1:50){
                all_states[x,1] = rankhospital(all_states[x,2], outcome, num)
        }
        return(all_states)
}
