# This is the document where I, Meshack, will code for the graphing questions.
library(tidyverse)

# (1) Plot Growth Rate for each LDC, per continent

ldc_growth <- ldc_data101 %>% ggplot(aes(x= year, y = gdp_growth)) + geom_point()
ldc_growth
