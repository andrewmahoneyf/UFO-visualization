install.packages(c("data.table", "dplyr", "ggplot2"))
library(data.table)
library(dplyr)
library(ggplot2)

## import static files
ufo_data <- fread("../data/UFOCoords.csv")

shapes <- ufo_data$Shape
ggplot(ufo_data, aes(Shape)) + geom_bar()