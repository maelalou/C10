library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggpubr)

p <- ggplot(data = continent_growth, aes(year, cont_avg_gdp_growth, col = continent)) + 
  geom_point() + 
  geom_line()
