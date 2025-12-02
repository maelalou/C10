# Here I, Meshack, will attempt to ascertain wheter a country is LDC (least developed) or not. This will be useful in answering one of our objectives.

setwd("C:/Users/mesha/OneDrive - Imperial College London/Autumn Term 2025/Data Science/Midterm/C10 - LDC/data sets")
library(tidyverse)

main_df <- read.csv("full_data.csv")

ldc_countries <- 
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


ldc_df <- data.frame(country = ldc_countries)

ldc_df <- ldc_df %>% 
  mutate(
    code = country_codes,
    Status = "Least Developed Country"
  )
  
View (ldc_df)

ldc_data101 <- main_df %>% semi_join(ldc_df, join_by(country))
View(ldc_data101)
