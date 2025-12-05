library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggpubr)


p <- ggplot(data = na.omit(continent_growth), aes(year, cont_avg_gdp_growth, col = continent)) + 
  geom_point() + 
  geom_line() + labs(title = "Average GDP per Capita Growth Rate (World)", subtitle = "For Continents of Africa, Asia, Europe, North America, South America and Oceania", x = "Year", y = "Average GDP per Capita Growth", caption = "Source: World Bank")  +
  scale_color_discrete(labels = toupper, name = "Continent") 

p



