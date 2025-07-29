library(tidyverse)

final_data <- readRDS("data/final_data.rds")

weighted_results <- final_data %>%
  group_by(track_status) %>%
  summarise(
    weighted_anc4 = weighted.mean(anc4, projected_births_2022, na.rm = TRUE),
    weighted_sba = weighted.mean(sba, projected_births_2022, na.rm = TRUE),
    total_births = sum(projected_births_2022, na.rm = TRUE),
    n_countries = n()
  )

weighted_results_long <- weighted_results %>%
  pivot_longer(cols = starts_with("weighted_"), names_to = "indicator", values_to = "coverage") %>%
  mutate(indicator = case_when(
    indicator == "weighted_anc4" ~ "ANC4 Coverage",
    indicator == "weighted_sba" ~ "SBA Coverage"
  ))

saveRDS(weighted_results_long, file = "data/weighted_results_long.rds")