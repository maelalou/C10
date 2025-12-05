library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggpubr)


p_box_all_pre <- ggplot(data = filter(continent_growth, year <= 2014), aes(continent, cont_avg_gdp_growth)) + 
  geom_boxplot()

p_box_all_post <- ggplot(data = filter(continent_growth, year >= 2015), aes(continent, cont_avg_gdp_growth)) + 
  geom_boxplot()

p_box_all <- ggarrange(p_box_all_pre, p_box_all_post, ncol=1, nrow = 2)



p_box_ldc_pre <- ggplot(data = filter(continent_ldc_growth, year <= 2014), aes(continent, cont_avg_gdp_growth)) + 
  geom_boxplot()

p_box_ldc_post <- ggplot(data = filter(continent_ldc_growth, year >= 2015), aes(continent, cont_avg_gdp_growth)) + 
  geom_boxplot()

p_box_ldc <- ggarrange(p_box_ldc_pre, p_box_ldc_post, ncol=1, nrow = 2)



p_box_noldc_pre <- ggplot(data = filter(continent_noldc_growth, year <= 2014), aes(continent, cont_avg_gdp_growth)) + 
  geom_boxplot()

p_box_noldc_post <- ggplot(data = filter(continent_noldc_growth, year >= 2015), aes(continent, cont_avg_gdp_growth)) + 
  geom_boxplot()

p_box_noldc <- ggarrange(p_box_noldc_pre, p_box_noldc_post, ncol=1, nrow = 2)
