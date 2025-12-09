library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggpubr)


p_box_all_pre <- ggplot(data = filter(continent_growth, year <= 2014), aes(continent, cont_avg_gdp_growth)) + 
  geom_boxplot() + 
  labs(title = "Box Plot for Continents Including All Countries", subtitle = "Pre-2015", x = "", y = "Average GDP per Capita Growth (%)")

p_box_all_post <- ggplot(data = filter(continent_growth, year >= 2015), aes(continent, cont_avg_gdp_growth)) + 
  geom_boxplot() + 
  labs(subtitle = "Post-2015", x = "", y = "", caption = "Source: World Bank")

p_box_all <- ggarrange(p_box_all_pre, p_box_all_post, ncol=1, nrow = 2)



p_box_ldc_pre <- ggplot(data = filter(continent_ldc_growth, year <= 2014), aes(continent, cont_avg_gdp_growth)) + 
  geom_boxplot() + 
  labs(title = "Box Plot for Continents Including LDCs", subtitle = "Pre-2015", x = "", y = "Average GDP per Capita Growth (%)")

p_box_ldc_post <- ggplot(data = filter(continent_ldc_growth, year >= 2015), aes(continent, cont_avg_gdp_growth)) + 
  geom_boxplot() + 
  labs(subtitle = "Post-2015", x = "", y = "", caption = "Source: World Bank")

p_box_ldc <- ggarrange(p_box_ldc_pre, p_box_ldc_post, ncol=1, nrow = 2)



p_box_noldc_pre <- ggplot(data = filter(continent_noldc_growth, year <= 2014), aes(continent, cont_avg_gdp_growth)) + 
  geom_boxplot() + 
  labs(title = "Box Plot for Continents Including Non-LDCs", subtitle = "Pre-2015", x = "", y = "Average GDP per Capita Growth (%)")

p_box_noldc_post <- ggplot(data = filter(continent_noldc_growth, year >= 2015), aes(continent, cont_avg_gdp_growth)) + 
  geom_boxplot() + 
  labs(subtitle = "Post-2015", x = "", y = "", caption = "Source: World Bank")

p_box_noldc <- ggarrange(p_box_noldc_pre, p_box_noldc_post, ncol=1, nrow = 2)
