##install.packages(c("dplyr","maps","data.table", "ggmap", "ggplot2","mapdata","maptools"))
library(data.table)
library(dplyr)
library(maps)
library(ggplot2)
library(ggmap)
library(mapdata)
library(maptools)
library(forcats)

## import static files
ufo_data <- fread("./data/UFOCoords.csv")

# getting the map
mapgilbert <- get_map(location = c(lon = mean(ufo_data$lng), lat = mean(ufo_data$lat)), zoom = 3,
                      maptype = "satellite", scale = 2)


# plotting the map with some points on it
ufo_map <- ggmap(mapgilbert) +
  geom_point(data = ufo_data, aes(x = lng, y = lat, fill = "red", alpha = 0.8), size = 1, shape = 21) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE) +
  labs(x="Longitude", y="Latitude")
ggsave("./img/ufo_map.jpg", ufo_map)

# plots

white.text <- element_text(face = "bold.italic", color = "#f93e3e")
ufo_shapes <- ggplot(ufo_data, aes(fct_infreq(Shape))) + geom_bar(fill = "#f93e3e") + labs(x="Shape", y="# of Sightings") + coord_flip() + theme(plot.background = element_rect(fill = "black")) + theme(axis.text.y=element_text(color="white")) + theme(axis.text.x=element_text(colour="white")) + theme(axis.title = white.text)
ggsave("./img/ufo_shapes.jpg", ufo_shapes)
