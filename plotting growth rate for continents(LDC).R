library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggpubr)


p_ldc_growth_africa <- ggplot(data = ldc_growth_africa, aes(year, gdp_growth, col = country)) +
  geom_point() + 
  geom_line() + 
  geom_hline(yintercept = 7, linetype = "dashed") 



p_ldc_growth_asia <- ggplot(data = ldc_growth_asia, aes(year, gdp_growth, col = country)) +
  geom_point() + 
  geom_line() + 
  geom_hline(yintercept = 7, linetype = "dashed")



p_ldc_growth_north_america <- ggplot(data = ldc_growth_north_america, aes(year, gdp_growth, col = country)) +
  geom_point() + 
  geom_line() + 
  geom_hline(yintercept = 7, linetype = "dashed")



p_ldc_growth_oceania <- ggplot(data = ldc_growth_oceania, aes(year, gdp_growth, col = country)) +
  geom_point() + 
  geom_line() + 
  geom_hline(yintercept = 7, linetype = "dashed")



p <- ggarrange(p_ldc_growth_africa, p_ldc_growth_asia, p_ldc_growth_north_america, p_ldc_growth_oceania, ncol = 2, nrow = 2)



p_ldc_avg_growth_africa <- ggplot(data = continent_ldc_growth_africa, aes(year, cont_avg_gdp_growth, col = continent)) + 
  geom_point() + 
  geom_line() + 
  geom_hline(yintercept = 7, linetype = "dashed")


 
p_ldc_avg_growth_asia <- ggplot(data = continent_ldc_growth_asia, aes(year, cont_avg_gdp_growth, col = continent)) + 
  geom_point() + 
  geom_line() + 
  geom_hline(yintercept = 7, linetype = "dashed")


                                 
p_ldc_avg_growth_north_america <- ggplot(data = continent_ldc_growth_North, aes(year, cont_avg_gdp_growth, col = continent)) + 
  geom_point() + 
  geom_line() + 
  geom_hline(yintercept = 7, linetype = "dashed")  



p_ldc_avg_growth_oceania <- ggplot(data = continent_ldc_growth_Oceania, aes(year, cont_avg_gdp_growth, col = continent)) + 
  geom_point() + 
  geom_line() + 
  geom_hline(yintercept = 7, linetype = "dashed")



p <- ggarrange(p_ldc_avg_growth_africa, p_ldc_avg_growth_asia, p_ldc_avg_growth_north_america, p_ldc_avg_growth_oceania, ncol = 2, nrow = 2)



