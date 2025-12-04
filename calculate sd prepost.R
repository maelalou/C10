remove_out <- function(original) {
  q1 <- quantile(original, 0.25, na.rm = TRUE)
  q3 <- quantile(original, 0.75, na.rm = TRUE)
  interval <- q3 - q1
  lower_bound <- q1 - 1.5 * interval
  upper_bound <- q3 + 1.5 * interval
  
  new <- original
  new[original < lower_bound | original > upper_bound] <- NA
  
  return(new)
}

sd_prepost_all <- continent_growth %>%
  group_by(continent) %>%
  summarise(
    pre_sd = sd(cont_avg_gdp_growth[year <= 2014], na.rm = TRUE),
    pre_sd_no_out = sd(remove_out(cont_avg_gdp_growth[year <= 2014]), na.rm = TRUE),
    post_sd = sd(cont_avg_gdp_growth[year >= 2015], na.rm = TRUE), 
    post_sd_no_out = sd(remove_out(cont_avg_gdp_growth[year >= 2015]), na.rm = TRUE),
  )

sd_prepost_ldc <- continent_ldc_growth %>%
  group_by(continent) %>%
  summarise(
    pre_sd = sd(cont_avg_gdp_growth[year <= 2014], na.rm = TRUE),
    pre_sd_no_out = sd(remove_out(cont_avg_gdp_growth[year <= 2014]), na.rm = TRUE),
    post_sd = sd(cont_avg_gdp_growth[year >= 2015], na.rm = TRUE), 
    post_sd_no_out = sd(remove_out(cont_avg_gdp_growth[year >= 2015]), na.rm = TRUE),
  )

sd_prepost_noldc <- continent_noldc_growth %>%
  group_by(continent) %>%
  summarise(
    pre_sd = sd(cont_avg_gdp_growth[year <= 2014], na.rm = TRUE),
    pre_sd_no_out = sd(remove_out(cont_avg_gdp_growth[year <= 2014]), na.rm = TRUE),
    post_sd = sd(cont_avg_gdp_growth[year >= 2015], na.rm = TRUE), 
    post_sd_no_out = sd(remove_out(cont_avg_gdp_growth[year >= 2015]), na.rm = TRUE),
  )


# Create output directory
output_dir <- "sd_data"
dir.create(output_dir, showWarnings = FALSE)

# Save ONLY the 12 CSV files
write_csv(sd_prepost_all, file.path(output_dir, "sd_prepost_all.csv"))
write_csv(sd_prepost_ldc, file.path(output_dir, "sd_prepost_ldc.csv"))
write_csv(sd_prepost_noldc, file.path(output_dir, "sd_prepost_noldc.csv"))



