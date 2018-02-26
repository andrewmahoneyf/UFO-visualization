##install.packages(c("data.table", "dplyr", "microbenchmark"))
library(data.table)
library(dplyr)

## Gets the working directory path for a7-collaboration
## Using relative path (~/...)

if(Sys.info()[["user"]] == "jacquesdebar") {
  PROJECTDIR <- file.path("~", "Documents", "INFO201", "Assignments", "a7-collaboration-PAJJ")
  fileName <- "jacques_results.Rdat"
} else if(Sys.info()[["user"]] == "pulithsilva") {
  PROJECTDIR <- file.path("~", "info201b", "a7-collaboration-PAJJ")
  fileName <- "pulith_results.Rdat"
} else if(Sys.info()[["user"]] == "andrewmahoney-fernandes") {
  PROJECTDIR <- file.path("~", "Desktop", "Info-201", "a7-collaboration-PAJJ")
  fileName <- "andrew_results.Rdat"
} else if (Sys.info()[["user"]] == "sanghawk") {
  PROJECTDIR <- file.path("~", "Documents", "Winter '18", "INFO 201", "a7-collaboration","a7-collaboration-PAJJ")
  fileName <- "sanghawk_results.Rdat"
} 

## Sets the instance to the user's appropriate working directory
setwd(PROJECTDIR)
getwd()

testRead <- function() {
  path <- paste(PROJECTDIR, "/data/UFOCoords.csv", sep="")
  system.time(ufo_data <- read.csv(path))
  system.time(ufo_data2 <- fread(path))
}