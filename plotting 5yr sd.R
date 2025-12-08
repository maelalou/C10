library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggpubr)

p_sd_5yr_all <- ggplot(data = na.omit(sd_5yr_all), aes(year, sd, col = continent)) + 
  geom_point() + 
  geom_line() + 
  labs(title = "SD of 5 rolling years (World)", subtitle = "For Continents of Africa, Asia, Europe, North America, South America and Oceania", x = "Year", y = "Average SD", caption = "Source: World Bank")  +
  scale_color_discrete(labels = toupper, name = "Continent") 

p_sd_5yr_LDCs <- ggplot(data = na.omit(sd_5yr_ldc), aes(year, sd, col = continent)) + 
  geom_point() + 
  geom_line() + 
  labs(title = "SD of 5 rolling years (LDCs)", subtitle = "For Continents of Africa, Asia, North America, and Oceania", x = "Year", y = "Average SD", caption = "Source: World Bank")  +
  scale_color_discrete(labels = toupper, name = "Continent") 

p_sd_5yr_nonLDCs <- ggplot(data = na.omit(sd_5yr_noldc), aes(year, sd, col = continent)) + 
  geom_point() + 
  geom_line() + 
  labs(title = "SD of 5 rolling years (Non-LDCs)", subtitle = "For Continents of Africa, Asia, Europe, North America, South America and Oceania", x = "Year", y = "Average SD", caption = "Source: World Bank")  +
  scale_color_discrete(labels = toupper, name = "Continent") 


