library(tidyverse)
library(ggplot2)

ldc <- read.csv("ldc_full_data.csv",
                stringsAsFactors = FALSE)

ldc_asia <- ldc %>%
  filter(continent == "Asia" & !is.na(youth_NIEET)) %>%
  group_by(year) %>%
  summarise(avg_neet = mean(youth_NIEET, na.rm = TRUE))

ggplot(ldc_asia, aes(x = year, y = avg_neet)) +
  geom_line(color = "pink", size = 1.1) +
  geom_point(size = 2) +
  theme_minimal() +
  labs(title = "Youth NEET Rate in Asian LDCs",
       x = "Year",
       y = "NEET (%)")
