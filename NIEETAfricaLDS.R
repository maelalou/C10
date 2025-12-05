library(tidyverse)
library(ggplot2)

ldc <- read.csv("ldc_full_data.csv",
                stringsAsFactors = FALSE)

ldc_africa <- ldc %>%
  filter(continent == "Africa" & !is.na(youth_NIEET)) %>%
  group_by(year) %>%
  summarise(avg_neet = mean(youth_NIEET, na.rm = TRUE))

ggplot(ldc_africa, aes(x = year, y = avg_neet)) +
  geom_line(color = "blue", size = 1.1) +
  geom_point(size = 2) +
  theme_minimal() +
  labs(title = "Youth NEET Rate in African LDCs",
       x = "Year",
       y = "NEET (%)")
