#In this R document, Meshack will ascertain growth rates for continents including and excluding LDCs.
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
  labs(title = "Average GDP Growth Rate by Year (Africa excluding LDCs)",
       x = "Year",
       y = "Average GDP Growth (%)") + geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = "dashed") 
africa_plot_noLDC 

#ASIA

asia_noLDC <- anti_join(country_growth_asia, ldc_df, by = "country")

asia_avg_growth_by_year <- asia_noLDC %>%
  group_by(year) %>%
  summarise(Average_Growth = mean(gdp_growth, na.rm = TRUE))

asia_plot_noLDC <- ggplot(asia_avg_growth_by_year, aes(x = year, y = Average_Growth)) +
  geom_line(colour = "grey",size = 1.2) +
  geom_point(colour = "black", size = 3) +
  labs(title = "Average GDP Growth Rate by Year (Asia excluding LDCs)",
       x = "Year",
       y = "Average GDP Growth (%)") + geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = "dashed")
asia_plot_noLDC  

#FOR NORTH AMERICA, IT IS ONLY HAITI (use Rinta graph)

#OCEANIA

oceania_noLDC <- anti_join(country_growth_Oceania, ldc_df, by = "country")

oceania_avg_growth_by_year <- oceania_noLDC %>%
  group_by(year) %>%
  summarise(Average_Growth = mean(gdp_growth, na.rm = TRUE))

oceania_plot_noLDC <- ggplot(oceania_avg_growth_by_year, aes(x = year, y = Average_Growth)) +
  geom_line(colour = "grey",size = 1.2) +
  geom_point(colour = "black", size = 3) +
  labs(title = "Average GDP Growth Rate by Year (Oceania excluding LDCs)",
       x = "Year",
       y = "Average GDP Growth (%)") + geom_smooth(method = "lm", se = FALSE, color = "blue", linetype = "dashed")
oceania_plot_noLDC 




### FINAL PLOTS


# Save the plot as a PNG file
dir.create("Plots")
ggsave("Plots/africa_noLDC.png", plot = africa_plot_noLDC, width = 8, height = 6, dpi = 300)
ggsave("Plots/asia_noLDC.png", plot = asia_plot_noLDC, width = 8, height = 6, dpi = 300)
ggsave("Plots/oceania_noLDC.png", plot = oceania_plot_noLDC, width = 8, height = 6, dpi = 300)
      