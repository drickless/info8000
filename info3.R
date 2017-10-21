library(tidyverse)

sgeo <- read.csv("~/Desktop/sgeoTable.csv")

a <- ggplot(data = sgeo)

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

