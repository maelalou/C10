library(ggpubr)



continent_ldc_growth <- ldc_full_data %>% 
  group_by(continent, year) %>%
  summarise(
    cont_avg_gdp_growth = mean(gdp_growth, na.rm = TRUE)
  )



ldc_growth_africa <- country_growth_africa %>% semi_join(ldc_countries, join_by(code))

continent_ldc_growth_africa <- continent_ldc_growth %>% 
  filter(continent == "Africa")



ldc_growth_asia <- country_growth_asia %>% semi_join(ldc_countries, join_by(code))

continent_ldc_growth_asia <- continent_ldc_growth %>%
  filter(continent == "Asia")



### no LDC in europe



ldc_growth_north_america <- country_growth_north_america %>% semi_join(ldc_countries, join_by(code))

continent_ldc_growth_North <- continent_ldc_growth %>%
  filter(continent == "North America")



ldc_growth_oceania <- country_growth_oceania %>% semi_join(ldc_countries, join_by(code))

continent_ldc_growth_Oceania <- continent_ldc_growth %>%
  filter(continent == "Oceania")



### no LDC in south america

# Create output directory
output_dir <- "continent_data(LDC)"
dir.create(output_dir, showWarnings = FALSE)

# Save ONLY the 12 CSV files
write_csv(continent_ldc_growth, file.path(output_dir, "continent_ldc_growth.csv"))

write_csv(ldc_growth_africa, file.path(output_dir, "ldc_growth_africa.csv"))
write_csv(continent_ldc_growth_africa, file.path(output_dir, "continent_ldc_growth_africa.csv"))

write_csv(ldc_growth_asia, file.path(output_dir, "ldc_growth_asia.csv"))
write_csv(continent_ldc_growth_asia, file.path(output_dir, "continent_ldc_growth_asia.csv"))

write_csv(ldc_growth_north_america, file.path(output_dir, "ldc_growth_north_america.csv"))
write_csv(continent_ldc_growth_North, file.path(output_dir, "continent_ldc_growth_North.csv"))

write_csv(ldc_growth_oceania, file.path(output_dir, "ldc_growth_oceania.csv"))
write_csv(continent_ldc_growth_Oceania, file.path(output_dir, "continent_ldc_growth_Oceania.csv"))

