## A function that takes in a dataset and returns a list of info about it:
DescribeData <- function(dataset) {
  ret <- list()
  ret$colnames <- colnames(dataset)
  ret$length <- nrow(dataset)
  ret$dim <- dim(dataset)
  ret$states_count <- dataset %>% group_by(State) %>% summarize(n = n())
  ret$shapes_count <- dataset %>% group_by(Shape) %>% summarize(n = n())
  return(ret)
}