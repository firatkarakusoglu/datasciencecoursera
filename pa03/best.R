best <- function(state, outcome) {
    
    ## Check that state and outcome are valid
    if (!(outcome %in% c("heart attack", "heart failure", "pneumonia"))) {
        stop('invalid outcome')
    }
    
    ## Read outcome data
    data <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    
    if (!state %in% unique(data$State)) {
        stop('invalid state')
    }
    
    ## Return hospital name in that state with lowest 30-day death rate
    
    stateData <- subset(data, data$State == state)
    cnum <- NA
    
    if (outcome == 'heart attack') {
        cnum <- 11
    }
    else if (outcome == 'heart failure') {
        cnum <- 17
    }
    else if (outcome == 'pneumonia') {
        cnum <- 23
    }
    
    stateData[, cnum] <- suppressWarnings(as.numeric(stateData[, cnum]))
    minv <- min(stateData[, cnum], na.rm = TRUE)
    hospital <- na.omit(stateData$Hospital.Name[stateData[, cnum] == minv])[1]
    hospital
}
