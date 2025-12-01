library(tidyverse)
library(janitor)


# CLEANING THE YOUTH DATA SET
youth_raw <- read.csv("youth-not-in-education-employment-training.csv")

youth <- youth_raw %>% 
  clean_names() #convert column names to snake case
  
  
youth_clean <- youth %>% #renaming the columns
  rename(
    country = entity,
    youth_NIEET = share_of_youth_not_in_education_employment_or_training_total_of_youth_population
  )


# str(youth_clean) #check structure of current data set


youth_clean <- youth_clean %>% #removing rows that are missing or values which are impossible
  filter(!is.na(youth_NIEET),
         youth_NIEET >= 0, youth_NIEET <= 100)


youth_clean %>% #check for duplicates - we want only one observation per country per year 
  count(country, year) %>% 
  filter(n > 1)







# CLEANING THE GDPC DATA SET

gdp_raw <- read_csv("gdp-per-capita-worldbank.csv", show_col_types = FALSE)

gdp <- gdp_raw %>% #convert column names to snake case
  clean_names()

gdp_clean <- gdp %>% #renaming the columns
  rename(
    country = entity,
    gdp_pc_2017 = gdp_per_capita_ppp_constant_2017_international
  )

#str(gdp_clean) #check structure of data set

gdp_clean <- gdp_clean %>%  #remove impossible or missing values 
  filter(!is.na(gdp_pc_2017),
         gdp_pc_2017 > 0)

gdp_clean %>% #check for duplicates 
  count(country, year) %>% 
  filter(n > 1)






# CLEANING THE CONTINENTS DATA SET

continents_raw <- read.csv("continents-according-to-our-world-in-data.csv")

continents_clean <- continents_raw %>% #convert column names to snake case
  clean_names() 

continents_clean <- continents_clean %>% #renaming columns 
  rename(
    country   = entity,
  )


continents_clean <- continents_clean %>% #removing the year because year is 2015 for all
  select(country, code, continent)


continents_clean %>% #checking for duplicates 
  count(country) %>% 
    filter(n > 1)






#JOINING ALL 3 DATA SETS 

full_data <- gdp_clean %>% 
  left_join(continents_clean, by = c("country", "code")) %>% 
  left_join(youth_clean, by = c("country", "year", "code"))


# CREATING A NEW FULL DATA SET WITH NO NA's

full_data_no_nas <- full_data %>% 
  filter(!is.na(youth_NIEET))