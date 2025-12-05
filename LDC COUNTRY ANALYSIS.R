#In this R Document, we will ascertain GDP per capita growth in Continents/countries considered LDC (Least Developed)
library(dplyr)
library(tidyverse)
library(ggplot2)

#AFRICA (LDCs only)

ldc_africa_df <- read.csv("continent_ldc_growth_africa.csv")

ldc_africa_avg_growth_by_year <- ldc_africa_df %>%
  group_by(year) %>%
  summarise(Average_Growth = mean(cont_avg_gdp_growth, na.rm = TRUE))

ldc_africa_plot <- ggplot(ldc_africa_avg_growth_by_year, aes(x = year, y = Average_Growth)) +
  geom_line(colour = "grey",size = 1.2) +
  geom_point(colour = "black", size = 3) +
  labs(title = "Average GDP per Capita Growth Rate by Year (LDCs in Africa)",
       x = "Year",
       y = "Average GDP per Capita Growth (%)") + geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = "dashed") + 
  geom_hline(yintercept = 7, linetype = "dashed", color = "darkgreen", size = 1) +
  annotate("text", x = 2005, y = 7.2, 
           label = "Benchmark (7%)", color = "darkgreen", vjust = -0.5) 
ldc_africa_plot 


# ASIA (LDCs only)

ldc_asia_df <- read.csv("continent_ldc_growth_asia.csv")

ldc_asia_avg_growth_by_year <- ldc_asia_df %>%
  group_by(year) %>%
  summarise(Average_Growth = mean(cont_avg_gdp_growth, na.rm = TRUE))

ldc_asia_plot <- ggplot(ldc_asia_avg_growth_by_year, aes(x = year, y = Average_Growth)) +
  geom_line(colour = "grey",size = 1.2) +
  geom_point(colour = "black", size = 3) +
  labs(title = "Average GDP per Capita Growth Rate by Year (LDCs in Asia)",
       x = "Year",
       y = "Average GDP per Capita Growth (%)") + geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = "dashed") + 
  geom_hline(yintercept = 7, linetype = "dashed", color = "darkgreen", size = 1) +
  annotate("text", x = 2005, y = 7.2, 
           label = "Benchmark (7%)", color = "darkgreen", vjust = -0.5, hjust = -1) 
ldc_asia_plot 

#OCEANIA (LDCs only)

ldc_oceania_df <- read.csv("continent_ldc_growth_asia.csv")

ldc_oceania_avg_growth_by_year <- ldc_oceania_df %>%
  group_by(year) %>%
  summarise(Average_Growth = mean(cont_avg_gdp_growth, na.rm = TRUE))

ldc_oceania_plot <- ggplot(ldc_oceania_avg_growth_by_year, aes(x = year, y = Average_Growth)) +
  geom_line(colour = "grey",size = 1.2) +
  geom_point(colour = "black", size = 3) +
  labs(title = "Average GDP per Capita Growth Rate by Year (LDCs in Oceania)",
       x = "Year",
       y = "Average GDP per Capita Growth (%)") + geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = "dashed") + 
  geom_hline(yintercept = 7, linetype = "dashed", color = "darkgreen", size = 1) +
  annotate("text", x = 2005, y = 7.2, 
           label = "Benchmark (7%)", color = "darkgreen", vjust = -0.5, hjust = -1) 
ldc_oceania_plot 

#Haiti (Only North American LDC)

haiti_df <- read.csv("continent_ldc_growth_North.csv")

haiti_avg_growth_by_year <- haiti_df %>%
  group_by(year) %>%
  summarise(Average_Growth = mean(cont_avg_gdp_growth, na.rm = TRUE))

haiti_plot <- ggplot(haiti_avg_growth_by_year, aes(x = year, y = Average_Growth)) +
  geom_line(colour = "grey",size = 1.2) +
  geom_point(colour = "black", size = 3) +
  labs(title = "Average GDP per Capita Growth Rate by Year (Haiti)",
       x = "Year",
       y = "Average GDP per Capita Growth (%)") + geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = "dashed") + 
  geom_hline(yintercept = 7, linetype = "dashed", color = "darkgreen", size = 1) +
  annotate("text", x = 2005, y = 7.2, 
           label = "Benchmark (7%)", color = "darkgreen", vjust = -0.5, hjust = -1) 
haiti_plot 


# Save files

dir.create("ldc_Plots")
ggsave("ldc_Plots/Africa_LDCs.png", plot = ldc_africa_plot, width = 8, height = 6, dpi = 300)
ggsave("ldc_Plots/Asia_LDCs.png", plot = ldc_asia_plot, width = 8, height = 6, dpi = 300)
ggsave("ldc_Plots/Oceania_LDCs.png", plot = ldc_oceania_plot, width = 8, height = 6, dpi = 300)
ggsave("ldc_Plots/Haiti.png", plot = haiti_plot, width = 8, height = 6, dpi = 300)

#CORRELATION COEFFICIENTS

print(cor(ldc_africa_avg_growth_by_year$year, ldc_africa_avg_growth_by_year$Average_Growth, use = "complete.obs", method = "pearson"))
print(cor(ldc_asia_avg_growth_by_year$year, ldc_asia_avg_growth_by_year$Average_Growth, use = "complete.obs", method = "pearson"))
print(cor(haiti_avg_growth_by_year$year, haiti_avg_growth_by_year$Average_Growth, use = "complete.obs", method = "pearson"))
print(cor(ldc_oceania_avg_growth_by_year$year, ldc_oceania_avg_growth_by_year$Average_Growth, use = "complete.obs", method = "pearson"))
