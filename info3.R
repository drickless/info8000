library(tidyverse)
library(ggplot2)

sgeo <- read.csv("/Volumes/SANDISK/CoastSurvey/sgeoTable.csv")
a <- ggplot(data = sgeo)

a +
  geom_bar(mapping = aes(x = Hincome))
a +
  geom_bar(mapping = aes(x = Ethnicity))
a +
  geom_bar(mapping = aes(x = Education))
a +
  geom_bar(mapping = aes(x = FldRisk))
