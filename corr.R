corr <- function (directory, threshold = 0) {
  complete_obs_data <- complete(directory)
  data_location <- complete_obs_data$id[complete_obs_data$nobs >= threshold]
  # print(data_location)
  cor_data <- as.numeric(c())
  for (i in data_location) {
    filename <- formatC(i,format="d",flag="0",width=3)
    filename <- paste0(filename,".csv")
    # print(filename)
    bulk_data <- read.csv(file.path(directory,filename),header=TRUE)
    # print(head(bulk_data))
    completeness_data <- complete.cases(bulk_data)
    # print(head(completeness_data))
    tmp <- cor(bulk_data$sulfate[completeness_data],
             bulk_data$nitrate[completeness_data])
    if (!is.na(tmp)) cor_data <- c(cor_data, tmp) 
    #print(cor_data[length(cor_data)])
  }
  return(cor_data)
}