## A function that takes in a dataset and returns a list of info about it:
describeData <- function(dataset) {
  ret <- list()
  ret$length <- nrow(dataset)
  ## do some more interesting stuff here
  ## add more components to 'ret', ...
  return(ret)
}