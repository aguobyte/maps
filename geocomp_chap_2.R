library(sf)            # classes and functions for vector data
library(terra)         # classes and functions for raster data
library(spData)        # load geographic data
library(spDataLarge)   # load larger geographic data
library(tidyverse)

# ----- 2.2 Vector Data

vignette(package ="sf")
vignette("sf1")

class(world)
names(world)
world$geom

plot(world) # shows a map of each of the data columns of the df.
# this seems to be because geom is included as a column

### Testing how the plotting works
world$numbers_test <- c(1, 2, 3) # i tested this to check if i add
# the numbers 1, 2, 3 and geom whether that would nicely plit it
plot_test <- world %>% select (geom, numbers_test)
plot(plot_test) # 
print("Success!")
### End Test

summary(world["lifeExp"]) # description from book
# Although we have only selected one variable for the summary() command, 
# it also outputs a report on the geometry. This demonstrates the ‘sticky’ 
# behavior of the geometry columns of sf objects: they are kept unless the 
# user deliberately removes them

world_mini = world[1:2, 1:3]
world_mini

world_dfr = st_read(system.file("shapes/world.gpkg", package = "spData"))

plot(world[3:6])
plot(world["numbers_test"]) # another way to just do one column

world_asia = world[world$continent == "Asia", ]
asia = st_union(world_asia)   
plot(world["pop"], reset = F) # because there is a key reset 
# has to be used
plot(asia, add = T, col = "red")

plot(world["continent"], reset = F)
cex = sqrt(world$pop) / 10000
cex
world_cents = st_centroid(world, of_largest = T)
plot(st_geometry(world_cents), add = T, cex = cex)
# this is an unprojected recreation with circles for population 
# i can make the projected version for the exercises for Chapter 2. 
plot(st_centroid(world_cents), add = T, cex = cex) # this just made things colorful
# ended on the part about st_centroids.

     

