library(tidyverse)
library(ggplot2)

full <- read.csv("full_data.csv",stringsAsFactors = F)

nieet_by_continent <- full %>%
  filter(!is.na(youth_NIEET)) %>%
  group_by(continent, year) %>%
  summarise(nieet = mean(youth_NIEET, na.rm = TRUE))

nieet_by_continent %>%
  ggplot(aes(x = year, y = nieet, colour = continent)) +
  geom_line()+
  geom_point(size = 1.2)+
  labs(
    title = "Average Youth NIEET Rate by Continent",
    x = "Year",
    y = "NIEET (%)"
  ) +
  theme_minimal()

data_2000 <- nieet_by_continent %>%
  filter(year == 2000) %>%
  select(continent, nieet) %>%
  rename(nieet_2000 = nieet)

data_2020 <- nieet_by_continent %>%
  filter(year == 2020) %>%
  select(continent, nieet) %>%
  rename(nieet_2020 = nieet)

nieet_change <- data_2000 %>%
  inner_join(data_2020, by = "continent") %>%
  mutate(change = nieet_2020 - nieet_2000)