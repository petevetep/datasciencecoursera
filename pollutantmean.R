pollutantmean <- function (directory, pollutant, id = 1:332) {
  filtered_data <- NULL
  for (i in id) {
    # print(i)
    filename <- formatC(i,format="d",flag="0",width=3)
    filename <- paste0(filename,".csv")
    # print(filename)
    bulk_data <- read.csv(file.path(directory,filename),header=TRUE)
    # print(head(bulk_data))
    pollution_raw_data <- bulk_data[pollutant]
    # print(head(pollution_raw_data))
    filtered_data <- c(filtered_data,
                       pollution_raw_data[!is.na(pollution_raw_data)])    
  }
  mean(filtered_data)
}