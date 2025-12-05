library(tidyverse)
full_data <- read_csv("full_data.csv")
full_data_q2 <- full_data %>%
  filter(year >= 2000, year <= 2023) %>%        
  filter(!is.na(continent),
         continent != "Antarctica") %>%         
  rename(
    neet_youth  = youth_NIEET,                   
    youth_unemp = youth_unemployment_rate        
  )
continent_year <- full_data_q2 %>%
  group_by(continent, year) %>%
  summarise(
    neet_mean  = mean(neet_youth,  na.rm = TRUE),
    unemp_mean = mean(youth_unemp, na.rm = TRUE),
    n_countries = n(),
    .groups    = "drop"
  )
ggplot(continent_year,
       aes(x = year, y = neet_mean, colour = continent)) +
  geom_line(linewidth = 1) +
  labs(
    title  = "Youth NEET rate by continent (ages 15–24)",
    x      = "Year",
    y      = "Average NEET (% of youth)",
    colour = "Continent"
  ) +
  theme_minimal()
ggplot(continent_year,
       aes(x = year, y = unemp_mean, colour = continent)) +
  geom_line(linewidth = 1) +
  labs(
    title  = "Youth unemployment rate by continent (ages 15–24)",
    x      = "Year",
    y      = "Average youth unemployment rate (%)",
    colour = "Continent"
  ) +
  theme_minimal()
neet_change_2000_2020 <- continent_year %>%
  filter(year %in% c(2000, 2020)) %>%
  select(continent, year, neet_mean) %>%
  pivot_wider(
    names_from  = year,
    values_from = neet_mean,
    names_prefix = "neet_"
  ) %>%
  mutate(
    abs_change = neet_2020 - neet_2000,
    rel_change = 100 * (neet_2020 - neet_2000) / neet_2000,
    substantial_reduction = case_when(
      rel_change <= -20 ~ "Yes (>= 20% drop)",  
      TRUE             ~ "No"
    )
  )

neet_change_2000_2020
unemp_change_2000_2020 <- continent_year %>%
  filter(year %in% c(2000, 2020)) %>%
  select(continent, year, unemp_mean) %>%
  pivot_wider(
    names_from  = year,
    values_from = unemp_mean,
    names_prefix = "unemp_"
  ) %>%
  mutate(
    abs_change = unemp_2020 - unemp_2000,
    rel_change = 100 * (unemp_2020 - unemp_2000) / unemp_2000
  )

unemp_change_2000_2020
key_years <- c(2000, 2010, 2020)

continent_key_years <- continent_year %>%
  filter(year %in% key_years)

ggplot(continent_key_years,
       aes(x = neet_mean,
           y = unemp_mean,
           colour = continent)) +
  geom_point(size = 3) +
  geom_text(aes(label = year), vjust = -0.6, size = 3) +
  labs(
    title  = "Youth NEET vs youth unemployment by continent",
    x      = "Average NEET (% of youth 15–24)",
    y      = "Average youth unemployment rate (%)",
    colour = "Continent"
  ) +
  theme_minimal()
