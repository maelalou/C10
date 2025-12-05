library(tidyverse)
library(ggplot2)

ldc <- read.csv("ldc_full_data.csv",
                stringsAsFactors = FALSE)

ldc_north <- ldc %>%
  filter(continent == "North America" &
           !is.na(youth_NIEET))

ggplot(ldc_north, aes(x = year, y = youth_NIEET)) +
  geom_line(color = "darkgreen", size = 1.1) +
  geom_point(size = 2) +
  theme_minimal() +
  labs(title = "Youth NEET Rate in Haiti (Only LDC in North America)",
       x = "Year",
       y = "NEET (%)")