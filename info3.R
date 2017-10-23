library(tidyverse)
#sgeo <- read.csv("~/Desktop/sgeoTable.csv")
sgeo <- read.csv("/Volumes/SANDISK/CoastSurvey/sgeoTable.csv")
a <- ggplot(data = sgeo)

#summary of three demographic variables
a +
  geom_bar(mapping = aes(x = as.factor(Hincome))) +
    scale_x_discrete(breaks = c(1:7), 
                     labels = c("<25K","25-35K","35-50K","50-75K","75-100K","100-150K",">150K"))
a +
  geom_bar(mapping = aes(x = as.factor(Ethnicity))) +
    scale_x_discrete(breaks = c(1:8), 
                  labels = c("White","Hispanic","Black","Asian","Native American",
                                "MidEast/N.Africa","Pacific Islander","Other"))
a +
  geom_bar(mapping = aes(x = as.factor(Education))) +
  scale_x_discrete(breaks = c(1:7),
                   labels = c("Did not finish HS","HS/GED","Some college","Assoc","Bachelors","Some grad","Grad degree"))

#Compare demographics with ability to recover

  #Ethnicity
a +
  geom_boxplot(mapping = aes(x = as.factor(Ethnicity),y = PCNoRecov))+
  scale_x_discrete(breaks = c(1:8), 
                   labels = c("White","Hispanic","Black","Asian","Native American",
                              "MidEast/N.Africa","Pacific Islander","Other"))+
  labs(x = "Ethnicity",y = "Ability to recover")
ggplot(sgeo, aes(PCNoRecov))+
  geom_bar(aes(fill = as.factor(Ethnicity))) +
  scale_fill_discrete(name = "Ethnicity", breaks = c(1:8),
                      labels = c("White","Hispanic","Black","Asian","Native American",
                                 "MidEast/N.Africa","Pacific Islander","Other")) +
  labs(x = "Ability to recover")

  #Income
ggplot(sgeo, aes(PCNoRecov))+
  geom_bar(aes(fill = as.factor(Hincome))) +
  scale_fill_discrete(name = "Income Category", breaks = c(1:7),
                      labels = c("<25K","25-35K","35-50K","50-75K","75-100K","100-150K",">150K")) +
  labs(x = "Ability to recover")
a+ 
  geom_boxplot(mapping = aes(x = as.factor(Hincome), y = PCNoRecov))+
  scale_x_discrete(breaks = c(1:7), 
                   labels = c("<25K","25-35K","35-50K","50-75K","75-100K","100-150K",">150K")) +
  labs(x = "Income Category", y = "Ability to recover")

  #Education
ggplot(sgeo, aes(PCNoRecov))+
  geom_bar(aes(fill = as.factor(Education))) +
  scale_fill_discrete(name = "Educational attainment", breaks = c(1:7),
                      labels = c("Did not finish HS","HS/GED","Some college","Assoc","Bachelors","Some grad","Grad degree")) +
  labs(x = "Ability to recover")
a +
  geom_boxplot(mapping = aes(x = as.factor(Education),y = PCNoRecov)) +
  scale_x_discrete(breaks = c(1:7),
                   labels = c("Did not finish HS","HS/GED","Some college","Assoc","Bachelors","Some grad","Grad degree"))+
  labs(x = "Educational Attainment", y = "Ability to recover")

#Compare demographics with concern about storms
a +
  geom_smooth(mapping = aes(SSDPers, savannnahDEM))


#maps
library(maptools)
library(ggmap)
#read shp
pts <- readShapePoints("/Volumes/SANDISK/CoastSurvey/Geo/sgeoCh_wgs.shp")
#load basemap
mapImage <- get_map(location = c(lon = -81.09, lat = 32.08),
                    color = "color",
                    maptype = "terrain",
                    source = "google",
                    zoom = 10)
#convert shp to ggplot-friendly data frame
pts_fr <- data.frame(pts)
#plot points on map
ggmap(mapImage) +
  geom_point(data = pts_fr, aes(x = long, y = lat))

