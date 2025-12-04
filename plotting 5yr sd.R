library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggpubr)

p_sd_5yr_all <- ggplot(data = sd_5yr_all, aes(year, sd, col = continent)) + 
  geom_point() + 
  geom_line()

p_sd_5yr_LDCs <- ggplot(data = sd_5yr_ldc, aes(year, sd, col = continent)) + 
  geom_point() + 
  geom_line()

p_sd_5yr_nonLDCs <- ggplot(data = sd_5yr_noldc, aes(year, sd, col = continent)) + 
  geom_point() + 
  geom_line()


