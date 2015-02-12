complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    files_full <- list.files(directory, full.names = TRUE)
    
    all_data <- data.frame()
    
    for (i in id) {
        complete_cases <- complete.cases(read.csv(files_full[i]))
        complete_count <- sum(complete_cases)
        all_data <- rbind(all_data, data.frame(id = i, nobs = complete_count))
    }
    
    all_data
}