library(ggpubr)


ldc_growth_africa <- country_growth_africa %>% semi_join(ldc_countries, join_by(code))

p_ldc_growth_africa <- ggplot(data = ldc_growth_africa, aes(year, gdp_growth, col = country)) + 
  geom_point() + 
  geom_line() + 
  geom_hline(yintercept = 7, linetype = "dashed") + 
  theme(legend.position = "none")
  


ldc_growth_asia <- country_growth_asia %>% semi_join(ldc_countries, join_by(code))

p_ldc_growth_asia <- ggplot(data = ldc_growth_asia, aes(year, gdp_growth, col = country)) + 
  geom_point() + 
  geom_line() + 
  geom_hline(yintercept = 7, linetype = "dashed")


### no LDC in europe


ldc_growth_north_america <- country_growth_north_america %>% semi_join(ldc_countries, join_by(code))

p_ldc_growth_north_america <- ggplot(data = ldc_growth_north_america, aes(year, gdp_growth, col = country)) + 
  geom_point() + 
  geom_line() + 
  geom_hline(yintercept = 7, linetype = "dashed")



ldc_growth_oceania <- country_growth_oceania %>% semi_join(ldc_countries, join_by(code))

p_ldc_growth_oceania <- ggplot(data = ldc_growth_oceania, aes(year, gdp_growth, col = country)) + 
  geom_point() + 
  geom_line() + 
  geom_hline(yintercept = 7, linetype = "dashed")



### no LDC in south america!

p <- ggarrange(p_ldc_growth_africa, p_ldc_growth_asia, p_ldc_growth_north_america, p_ldc_growth_oceania, ncol = 2, nrow = 2)
