youth_unemp_raw <- read.csv("unemployment-rate-for-young-people.csv")

youth_unemp <- youth_unemp_raw %>% #convert column names to snake case
  clean_names() 

youth_unemp_clean <- youth_unemp %>% 
  rename(
    country   = entity,
    youth_unemployment_rate = unemployment_youth_total_of_total_labor_force_ages_15_24_modeled_ilo_estimate
  )