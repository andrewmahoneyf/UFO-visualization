install.packages(c("data.table", "dplyr", ""))
library(data.table)
library(dplyr)

## import static files
system.time(ufo_data <- fread("data/UFOCoords.csv"))