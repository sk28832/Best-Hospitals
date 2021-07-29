# Finding the Best Hospitals

## Overview
In this project, I take data from the Hospital Compare database and compare patient 
mortality rates between hospitals for three main health conditions --heart attack, 
heart failure, and pneumonia. Using R's data analysis tools, I compiled a list of 
the best hospitals (by mortality rate)to visit for any of the health conditions in 
each of the states in the US.

## What's contained in each of the files?

### data_check.R
In this file, I am simply reading in the csv file that contains all the hospital data 
for the project (outcome-of-care-measures.csv) and making a test histogram for heart 
attack mortality rates in hospitals across the US:

<img width="918" alt="Screen Shot 2021-07-28 at 3 43 41 PM" src="https://user-images.githubusercontent.com/33585911/127419347-598b4afd-431b-434c-91ef-a553bc334020.png">

### best_in_state.R
This was the first version of my mortality rate comparison function, the best function. 
I took in two parameters, state and outcome, which corresponded to which state and 
medical condition the user wanted to focus on respectively. The function returns the 
best hospital for the specified medical condition in the state that was provided.

### ranking_hospitals_state.R
This was the next step of my mortality rate comparison function, the rankhospital function.
Much like the best function, I take in state and outcome parameters; however, I also take in
another parameter called num. This num parameter specifies the rank of the hospital we would 
like to find (e.g. the 3rd best hospital for heart attacks in Texas).

### ranking_hospitals_all.R
Finally, this was the final version of my mortality rate comparison function, the rankall function.
It provides the same functionality as the rankhospital function, except that it tabulates results
for all of the states.

For example, we could find the best heart attack hospitals in each of the states:
![best_hospital_plot](https://user-images.githubusercontent.com/33585911/127420694-254e09e0-b0d1-4e50-8498-9fe4e9ca0a5e.png)

Or we could find the worst heart attack hospitals in each of the states:
![worst_hospital_plot](https://user-images.githubusercontent.com/33585911/127420741-8f15e59c-1e3b-4d26-b40e-86df5bcea0f0.png)

##Side Notes
1. Ties in rank are broken by which hospital comes first alphabetically
2. State and medical condition names must be exact ("heart attack" is accepted, "hert attack" isn't)
3. A rank that exceeds the total number of hospitals in a set of data returns "NA"
