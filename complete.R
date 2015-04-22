complete <- function (directory, id = 1:332) {
  count_data <- NULL
  for (i in id) {
    filename <- formatC(i,format="d",flag="0",width=3)
    filename <- paste0(filename,".csv")
    # print(filename)
    bulk_data <- read.csv(file.path(directory,filename),header=TRUE)
    # print(head(bulk_data))
    completeness_data <- complete.cases(bulk_data)
    # print(head(completeness_data))
    count_data <- c(count_data, length(completeness_data[completeness_data])) 
    
  }
  res <- data.frame(id,count_data)
  names(res) <- c("id","nobs")
  return(res)
}