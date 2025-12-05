library(tidyverse)
library(ggplot2)

ldc <- read.csv("ldc_full_data.csv",
                stringsAsFactors = FALSE)

ldc_oceania <- ldc %>%
  filter(continent == "Oceania" & !is.na(youth_NIEET)) %>%
  group_by(year) %>%
  summarise(avg_neet = mean(youth_NIEET, na.rm = TRUE))

ggplot(ldc_oceania, aes(x = year, y = avg_neet)) +
  geom_line(color = "purple", size = 1.1) +
  geom_point(size = 2) +
  theme_minimal() +
  labs(title = "Youth NEET Rate in Oceania LDCs",
       x = "Year",
       y = "NEET (%)")