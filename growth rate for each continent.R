library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)

continent_growth <- full_data %>% 
  group_by(continent, year) %>%
  summarise(
    cont_avg_gdp_growth = mean(gdp_growth, na.rm = TRUE)
  )



country_growth_africa <- full_data %>% 
  filter(continent == "Africa")

continent_growth_africa <- continent_growth %>%
  filter(continent == "Africa")


country_growth_asia <- full_data %>% 
  filter(continent == "Asia")

continent_growth_asia <- continent_growth %>%
  filter(continent == "Asia")


country_growth_Europe <- full_data %>% 
  filter(continent == "Europe")

continent_growth_Europe <- continent_growth %>%
  filter(continent == "Europe")


country_growth_North <- full_data %>% 
  filter(continent == "North America")

continent_growth_North <- continent_growth %>%
  filter(continent == "North America")


country_growth_Oceania <- full_data %>% 
  filter(continent == "Oceania")

continent_growth_Oceania <- continent_growth %>%
  filter(continent == "Oceania")


country_growth_South <- full_data %>% 
  filter(continent == "South America")

continent_growth_Soutrh <- continent_growth %>%
  filter(continent == "South America")





# Create output directory
output_dir <- "continent_data"
dir.create(output_dir, showWarnings = FALSE)

# Save ONLY the 12 CSV files
write_csv(country_growth_africa, file.path(output_dir, "country_growth_africa.csv"))
write_csv(continent_growth_africa, file.path(output_dir, "continent_growth_africa.csv"))

write_csv(country_growth_asia, file.path(output_dir, "country_growth_asia.csv"))
write_csv(continent_growth_asia, file.path(output_dir, "continent_growth_asia.csv"))

write_csv(country_growth_Europe, file.path(output_dir, "country_growth_europe.csv"))
write_csv(continent_growth_Europe, file.path(output_dir, "continent_growth_europe.csv"))

write_csv(country_growth_North, file.path(output_dir, "country_growth_north_america.csv"))
write_csv(continent_growth_North, file.path(output_dir, "continent_growth_north_america.csv"))

write_csv(country_growth_Oceania, file.path(output_dir, "country_growth_oceania.csv"))
write_csv(continent_growth_Oceania, file.path(output_dir, "continent_growth_oceania.csv"))

write_csv(country_growth_South, file.path(output_dir, "country_growth_south_america.csv"))
write_csv(continent_growth_Soutrh, file.path(output_dir, "continent_growth_south_america.csv"))

