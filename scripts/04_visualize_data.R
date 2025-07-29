library(tidyverse)
library(ggplot2)

weighted_results_long <- readRDS("data/weighted_results_long.rds")

coverage_plot <- ggplot(weighted_results_long, aes(x = track_status, y = coverage, fill = indicator)) +
  geom_col(position = "dodge") +
  labs(title = "Population-Weighted Coverage by Track Status",
       x = "Track Status",
       y = "Coverage (%)") +
  theme_minimal()

ggsave("output/coverage_plot.png", plot = coverage_plot, width = 8, height = 6, dpi = 300)