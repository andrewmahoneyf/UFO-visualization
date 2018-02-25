install.packages(c("data.table", "dplyr", "microbenchmark"))
library(data.table)
library(dplyr)

## import static files
system.time(ufo_data <- fread("data/UFOCoords.csv"))