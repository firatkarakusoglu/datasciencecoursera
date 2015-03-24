corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    
    files_full <- list.files(directory, full.names = TRUE)
    result <- vector()
    
    for (filename in files_full) {
        all_cases <- read.csv(filename)
        complete_count <- sum(complete.cases(all_cases))
        if (complete_count > threshold) {
            result <- c(result, cor(all_cases[, "nitrate"], all_cases[, "sulfate"], use = "complete.obs"))
        }
    }
    
    result
}