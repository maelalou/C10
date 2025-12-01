library(dplyr)

full_data

full_data2 <- full_data %>% 
  arrange(country, year) %>% #sorting rows by chronological order
  group_by(country, continent) %>% #when calculating growth, each country should be treated separately
  mutate(gdp_growth = (gdp_pc_2017 - lag(gdp_pc_2017)) / lag(gdp_pc_2017) * 100) %>% 
  ungroup()

view(full_data)

write_csv(full_data, "full_data.csv")
