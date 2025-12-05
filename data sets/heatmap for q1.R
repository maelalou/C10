full_data <- read.csv("full_data.csv")

gdp_continent <- full_data %>%
  filter(continent != "Antarctica") %>%
  filter(!is.na(gdp_growth))


gdp_growth_continent <- gdp_continent %>%
  group_by(continent, year) %>%
  summarise(
    mean_gdp_growth = mean(gdp_growth, na.rm = TRUE)
  ) %>%
  ungroup()

heatmap_gdp <- ggplot(gdp_growth_continent,
                      aes(x = year, y = continent, fill = mean_gdp_growth)) +
  geom_tile(color = "white") +
  scale_fill_gradient2(
    name = "Mean GDP growth\n(% per year)",
    low = "red",
    mid = "white",
    high = "darkblue",
    midpoint = 0
  ) +
  labs(
    title = "GDP per Capita Growth by Continent Over Time",
    x = "Year",
    y = "Continent"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    axis.text.x = element_text(angle = 45, hjust = 1),
    panel.grid = element_blank()
  )

heatmap_gdp
