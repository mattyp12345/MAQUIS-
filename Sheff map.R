install.packages("dplyr")
install.packages("ggplot2")
install.packages("ggmap")
install.packages("mapproj")
install.packages("rgdal")


library(dplyr)
library(ggplot2)
library(ggmap)
library(mapproj)
library(rgdal)

#get basemap from GOOGLE and plot parks

# get map
map <- get_map(location = 'Sheffield', zoom = 12) 
#load park data & plot to check
PCS <- readOGR(dsn="parks/",layer="PCS")
plot(PCS)

# name projection codes
latlong = "+init=epsg:4326"
ukgrid = "+init=epsg:27700"
google = "+init=epsg:3857"

# assign projection of park data (sourced from: 
# https://data.gov.uk/dataset/sheffield-city-council-parks-and-countryside-service-sites)
proj4string(PCS) <- CRS(ukgrid)
# create new files with different projections
PCSg <- spTransform(PCS, CRS(google))
PCSl <- spTransform(PCS, CRS(latlong))

# extract coordinate data into a data.frame
df <- setNames(data.frame(PCSl@coords), c("x", "y"))

# PLOT!
ggmap(map) + geom_point(data=df, aes(x=x, y=y),size=1)








## this is probs rubbish##
p <- ggplot() +
  geom_polygon(data = map, aes(x = Longitude, y = Latitude, group = group,
                                    fill = Price), color = "black", size = 0.25)
## this might be useful
houseprice.data %>% select(Price)
write.csv(houseprice.data %>% select(Price))
data.frame <- (price)

#postcode points
ggmap(map)+
  geom_point(aes(x = Longitude, y = Latitude), data = Price,  
             alpha = .5, color="darkred", size = 3)


install.packages("maptools")
library(maptools)
install.packages("rgdal") 
library(rgdal)


# read in shapefiles

shpData <- readOGR(".","gb_pca_2010") 

proj4string(shpData) <- CRS("+proj=longlat +ellps=WGS84")
proj4string(shpData)
gdalinfo (gb_pca_2010.shp)

#transform to 
shpData <- spTransform(shpData, CRS("+proj=longlat +datum=WGS84"))

ggmap(map)+ geom_point(aes(x = Longitude, y = Latitude), data = gb_pca_2010, alpha = .5, color="darkred", size = 3)

library(rgdal)
shape_rgdal <- readOGR(".", "gb_pca_2010")
proj4string(gb_pca_2010.shp)
shpData <- spTransform(shape_rgdal, CRS("+proj=longlat +datum=WGS84"))

#####################################################################

install.packages("colorspace")

#houseprice data 


install.packages("colorspace")
library("colorspace")

ggmap(map)+geom_point(aes(x = Longitude, y = Latitude), data = houseprice.data, alpha = .5, color= "rainbow_hcl(7)" + scale_colour_manual(values=Price(7))


Price <- data.frame(houseprice.data, (Price))


##This works##
ggmap(map)+geom_point(data = houseprice.data, mapping = aes(x = Longitude, y = Latitude, color = Price))
                      

library("colorspace")
pal <- choose_palette()




###############################################
install.packages("rdgal")
library(rgdal)

#report shapefile details
ogrInfo(".", "gb_pca_2010")

#read in shapefiles
postcodes <- readOGR(".", "gb_pca_2010")

print(proj4string(postcodes))

#generate map of pcas
plot(postcodes, axes=TRUE, border="gray")

#write new shapefile
writeOGR(postcodes, ".", "postcodes-rgdal1.prj", driver="ESRI Shapefile")
readOGR("postcodes-rgdal")
readOGR("postcodes-rgdal1")
ogrInfo("postcodes-rdgal")

#can we extract sheffield from this?

############################################


#parks and coutryside data
shape <- readOGR(dsn = ".", layer = "~/workspace/map")





#spatstat
#rgeos also useful




