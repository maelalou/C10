library(dplyr)

full_data

full_data <- full_data %>% 
  arrange(country, year) %>% #sorting rows by chronological order
  group_by(country, continent) %>% #when calculating growth, each country should be treated separately
  mutate(gdp_growth = (gdp_pc_2017 - lag(gdp_pc_2017)) / lag(gdp_pc_2017) * 100) %>% 
  ungroup()







# ADDING THE DATA FRAME TO OUR full_data DATA FRAME 


youth_unemp_raw <- read.csv("unemployment-rate-for-young-people.csv")

youth_unemp <- youth_unemp_raw %>% #convert column names to snake case
  clean_names() 

youth_unemp_clean <- youth_unemp %>% #renaming the columns
  rename(
    country   = entity,
    youth_unemployment_rate = unemployment_youth_total_of_total_labor_force_ages_15_24_modeled_ilo_estimate
  )

str(youth_unemp_clean) #checking the structure of our data frame


full_data <- full_data %>% #adding youth unemployment to our full_data data frame
  left_join(youth_unemp_clean, by = c("country", "code", "year"))


write_csv(full_data, "full_data.csv")
