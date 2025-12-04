# Here I, Meshack, will attempt to ascertain wheter a country is LDC (least developed) or not. This will be useful in answering one of our objectives.

setwd("C:/Users/mesha/OneDrive - Imperial College London/Autumn Term 2025/Data Science/Midterm/C10 - LDC/data sets")
library(tidyverse)

ldc_country_names <- 
  c(
    "Afghanistan", "Angola", "Bangladesh", "Benin", "Burkina Faso", "Burundi", "Cambodia", "Central African Republic", "Chad", "Comoros", "Democratic Republic of Congo",
    "Djibouti", "Ethiopia", "Gambia", "Guinea", "Guinea-Bissau", "Haiti",
    "Kiribati", "Laos", "Lesotho", "Liberia", "Madagascar",
    "Malawi", "Mali", "Mauritania", "Mozambique", "Myanmar", "Nepal", "Niger",
    "Rwanda", "Senegal", "Sierra Leone", "Solomon Islands", "Somalia",
    "Sudan", "East Timor", "Togo", "Tuvalu", "Uganda", "Tanzania",
    "Zambia")

country_codes <- c("AFG","AGO","BGD","BEN","BFA","BDI","KHM","CAF","TCD","COM", "COD",
                   "DJI","ETH","GMB","GIN","GNB","HTI","KIR", "LAO","LSO","LBR","MDG",
                   "MWI","MLI","MRT","MOZ","MMR","NPL","NER","RWA","SEN","SLE",
                   "SLB","SOM","SDN", "TLS", "TGO","TUV","UGA", "TZA","ZMB")


ldc_countries <- data.frame(country = ldc_country_names)

ldc_countries <- ldc_countries %>% 
  mutate(
    code = country_codes,
    Status = "Least Developed Country"
  )

ldc_full_data <- full_data %>% semi_join(ldc_countries, join_by(code))

output_dir <- "data sets"
dir.create(output_dir, showWarnings = FALSE)

write_csv(ldc_countries, file.path(output_dir, "ldc_countries.csv"))
write_csv(ldc_full_data, file.path(output_dir, "ldc_full_data.csv"))

