install.packages(c("dplyr","maps","data.table", "ggmap", "ggplot2","mapdata","maptools"))
library(data.table)
library(dplyr)
library(maps)
library(ggplot2)
library(ggmap)
library(mapdata)
library(maptools)

## import static files
system.time(ufo_data <- fread("../data/UFOCoords.csv"))

# getting the map
mapgilbert <- get_map(location = c(lon = mean(ufo_data$lng), lat = mean(ufo_data$lat)), zoom = 4,
                      maptype = "satellite", scale = 2)

# plotting the map with some points on it
ufo_map <- ggmap(mapgilbert) +
  geom_point(data = ufo_data, aes(x = lng, y = lat, fill = "red", alpha = 0.8), size = 2, shape = 21) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE)

# plots
shapes <- ufo_data$Shape
ufo_shapes <- ggplot(ufo_data, aes(Shape)) + geom_bar()
