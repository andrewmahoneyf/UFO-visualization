##install.packages(c("dplyr","maps","data.table", "ggmap", "ggplot2","mapdata","maptools", "forcats"))
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
red.text <- element_text(size=16, face = "bold.italic", color = "#f93e3e")

# getting the map
mapgilbert <- get_map(location = c(lon = mean(ufo_data$lng), lat = mean(ufo_data$lat)), zoom = 3,
                      maptype = "satellite", scale = 2)


# plotting the map with some points on it
ufo_map <- ggmap(mapgilbert) +
  geom_point(data = ufo_data, aes(x = lng, y = lat, fill = "red", alpha = 0.8), size = 1, shape = 21) +
  coord_fixed(ratio = 0.925) +
  guides(fill=FALSE, alpha=FALSE, size=FALSE) +
  labs(x="Longitude", y="Latitude") +
  theme(plot.background = element_rect(fill="black")) +
  theme(axis.text.y=element_text(color="white")) + theme(axis.text.x=element_text(colour="white")) + 
  theme(axis.title = red.text)
ggsave("./img/ufo_map.jpg", ufo_map)

# plots

ufo_shapes <- ggplot(ufo_data, aes(fct_infreq(Shape))) + geom_bar(fill = "#f93e3e") + 
  labs(x="Shape", y="# of Sightings") + coord_flip() + 
  theme(plot.background = element_rect(fill = "black")) + 
  theme(axis.text.y=element_text(color="white")) + theme(axis.text.x=element_text(colour="white")) + 
  theme(axis.title = red.text)
ggsave("./img/ufo_shapes.jpg", ufo_shapes)
