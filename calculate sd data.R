library(tidyverse)
library(ggplot2)
library(dplyr)
library(tidyr)
library(ggpubr)


cal_5yr_sd <- function(avg_growth) {
  result <- rep(NA, length(avg_growth))

  for (i in 1:length(avg_growth)) {
    if(i >= 5){
      span <- avg_growth[(i-4):i]
      if(!any(is.na(span))){
        result[i] <- sd(span)
      }
    }
  }
  
  return(result)
}

sd_5yr_all <- continent_growth %>%
  group_by(continent) %>%
  mutate(sd = cal_5yr_sd(cont_avg_gdp_growth))

sd_5yr_LDCs <- continent_ldc_growth %>%
  group_by(continent) %>%
  mutate(sd = cal_5yr_sd(cont_avg_gdp_growth))

sd_5yr_nonLDCs <- continent_noldc_growth %>%
  group_by(continent) %>%
  mutate(sd = cal_5yr_sd(cont_avg_gdp_growth))


# Create output directory
output_dir <- "sd_data"
dir.create(output_dir, showWarnings = FALSE)

# Save ONLY the 12 CSV files
write_csv(sd_5yr_all, file.path(output_dir, "sd_5yr_all.csv"))

write_csv(sd_5yr_LDCs, file.path(output_dir, "sd_5yr_LDCs.csv"))

write_csv(sd_5yr_nonLDCs, file.path(output_dir, "sd_5yr_nonLDCs.csv"))
