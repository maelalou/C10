#In this R document, Meshack will ascertain growth rates for continents excluding LDCs.
library(dplyr)
library(tidyverse)
library(ggplot2)

#CONTINENTAL AVERAGE GROWTH RATE EXCLUDING LDCs

#AFRICA

africa_noLDC <- anti_join(country_growth_africa, ldc_df, by = "country")

africa_avg_growth_by_year <- africa_noLDC %>%
  group_by(year) %>%
  summarise(Average_Growth = mean(gdp_growth, na.rm = TRUE))

africa_plot_noLDC <- ggplot(africa_avg_growth_by_year, aes(x = year, y = Average_Growth)) +
  geom_line(colour = "grey",size = 1.2) +
  geom_point(colour = "black", size = 3) +
  labs(title = "Average GDP per Capita Growth Rate by Year (Africa excluding LDCs)",
       x = "Year",
       y = "Average GDP per Capita Growth (%)") + geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = "dashed") 
africa_plot_noLDC 

#ASIA

asia_noLDC <- anti_join(country_growth_asia, ldc_df, by = "country")

asia_avg_growth_by_year <- asia_noLDC %>%
  group_by(year) %>%
  summarise(Average_Growth = mean(gdp_growth, na.rm = TRUE))

asia_plot_noLDC <- ggplot(asia_avg_growth_by_year, aes(x = year, y = Average_Growth)) +
  geom_line(colour = "grey",size = 1.2) +
  geom_point(colour = "black", size = 3) +
  labs(title = "Average GDP per Capita Growth Rate by Year (Asia excluding LDCs)",
       x = "Year",
       y = "Average GDP per Capita Growth (%)") + geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = "dashed")
asia_plot_noLDC  

#FOR NORTH AMERICA, ITS ONLY HAITI NOT MENTIONED

North_America_noLDC <- anti_join(country_growth_North_America, ldc_df, by = "country")

North_America_avg_growth_by_year <- North_America_noLDC %>%
  group_by(year) %>%
  summarise(Average_Growth = mean(gdp_growth, na.rm = TRUE))

North_America_noLDC <- ggplot(North_America_avg_growth_by_year, aes(x = year, y = Average_Growth)) +
  geom_line(colour = "grey",size = 1.2) +
  geom_point(colour = "black", size = 3) +
  labs(title = "Average GDP per Capita Growth Rate by Year (North America excluding Haiti)",
       x = "Year",
       y = "Average GDP per Capita Growth (%)") + geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = "dashed")
North_America_noLDC

#South America

South_America_noLDC <- anti_join(country_growth_South_America, ldc_df, by = "country")

South_America_avg_growth_by_year <- South_America_noLDC %>%
  group_by(year) %>%
  summarise(Average_Growth = mean(gdp_growth, na.rm = TRUE))

South_America_noLDC <- ggplot(South_America_avg_growth_by_year, aes(x = year, y = Average_Growth)) +
  geom_line(colour = "grey",size = 1.2) +
  geom_point(colour = "black", size = 3) +
  labs(title = "Average GDP per Capita Growth Rate by Year (South America)",
       x = "Year",
       y = "Average GDP per Capita Growth (%)") + geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = "dashed")
South_America_noLDC


#OCEANIA

oceania_noLDC <- anti_join(country_growth_Oceania, ldc_df, by = "country")

oceania_avg_growth_by_year <- oceania_noLDC %>%
  group_by(year) %>%
  summarise(Average_Growth = mean(gdp_growth, na.rm = TRUE))

oceania_plot_noLDC <- ggplot(oceania_avg_growth_by_year, aes(x = year, y = Average_Growth)) +
  geom_line(colour = "grey",size = 1.2) +
  geom_point(colour = "black", size = 3) +
  labs(title = "Average GDP per Capita Growth Rate by Year (Oceania excluding LDCs)",
       x = "Year",
       y = "Average GDP per Capita Growth (%)") + geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = "dashed")
oceania_plot_noLDC

# EUROPE

europe_noLDC <- anti_join(country_growth_Europe, ldc_df, by = "country")

europe_avg_growth_by_year <- europe_noLDC %>%
  group_by(year) %>%
  summarise(Average_Growth = mean(gdp_growth, na.rm = TRUE))

europe_plot_noLDC <- ggplot(europe_avg_growth_by_year, aes(x = year, y = Average_Growth)) +
  geom_line(colour = "grey",size = 1.2) +
  geom_point(colour = "black", size = 3) +
  labs(title = "Average GDP per Capita Growth Rate by Year (Europe)",
       x = "Year",
       y = "Average GDP per Capita Growth (%)") + geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = "dashed")
europe_plot_noLDC 


### FINAL PLOTS


# Save the plot as a PNG file
dir.create("Plots")
ggsave("Plots/africa_noLDC.png", plot = africa_plot_noLDC, width = 8, height = 6, dpi = 300)
ggsave("Plots/asia_noLDC.png", plot = asia_plot_noLDC, width = 8, height = 6, dpi = 300)
ggsave("Plots/oceania_noLDC.png", plot = oceania_plot_noLDC, width = 8, height = 6, dpi = 300)
ggsave("Plots/North_America_noLDC.png", plot = North_America_noLDC, width = 8, height = 6, dpi = 300)
ggsave("Plots/South_America_noLDC.png", plot = South_America_noLDC, width = 8, height = 6, dpi = 300)
ggsave("Plots/europe_noLDC.png", plot = europe_plot_noLDC, width = 8, height = 6, dpi = 300)



#PRINTING

print(cor(africa_avg_growth_by_year$year, africa_avg_growth_by_year$Average_Growth, use = "complete.obs", method = "pearson")) 
print(cor(asia_avg_growth_by_year$year, asia_avg_growth_by_year$Average_Growth, use = "complete.obs", method = "pearson"))
print(cor(North_America_avg_growth_by_year$year, North_America_avg_growth_by_year$Average_Growth, use = "complete.obs", method = "pearson"))
print(cor(South_America_avg_growth_by_year$year, South_America_avg_growth_by_year$Average_Growth, use = "complete.obs", method = "pearson"))
print(cor(oceania_avg_growth_by_year$year, oceania_avg_growth_by_year$Average_Growth, use = "complete.obs", method = "pearson"))
print(cor(europe_avg_growth_by_year$year, europe_avg_growth_by_year$Average_Growth, use = "complete.obs", method = "pearson"))



      