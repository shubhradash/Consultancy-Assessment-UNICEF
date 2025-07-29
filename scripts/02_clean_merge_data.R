library(tidyverse)
library(countrycode)
library(janitor)

# Clean and prepare the UNICEF indicator data to only include country data
unicef_data <- readRDS("data/unicef_data.rds")

unicef_data <- unicef_data %>%
  mutate(iso3c = countrycode(`REF_AREA:Geographic area`, origin = "country.name", destination = "iso3c"))

unicef_countries_only <- unicef_data %>%
  filter(!is.na(iso3c))

unicef_latest <- unicef_countries_only %>%
  group_by(iso3c,`INDICATOR:Indicator`) %>%
  slice_max(order_by = `TIME_PERIOD:Time period`, n = 1, with_ties = FALSE) %>%
  ungroup()

unicef_wide <- unicef_latest %>%
  select(iso3c, `REF_AREA:Geographic area`, `INDICATOR:Indicator`, `OBS_VALUE:Observation Value`) %>%
  pivot_wider(names_from = `INDICATOR:Indicator`, values_from = `OBS_VALUE:Observation Value`) %>%
  rename(anc4 =`MNCH_ANC4: Antenatal care 4+ visits - percentage of women (aged 15-49 years) attended at least four times during pregnancy by any provider`, sba = `MNCH_SAB: Skilled birth attendant - percentage of deliveries attended by skilled health personnel`)

# Clean and prepare mortality status data
mortality_status <- mortality_status_raw %>%
  clean_names() %>%
  filter(status_u5mr %in% c("Achieved", "On Track", "Acceleration Needed")) %>%
  mutate(track_status = case_when(
    status_u5mr %in% c("Achieved", "On Track") ~ "On Track",
    status_u5mr == "Acceleration Needed" ~ "Off Track"
  ))

# Clean and prepare WPP (pop) data
str(pop_data$births_thousands)

birth_data <- pop_data %>%
  filter(year == 2022, type == "Country/Area") %>%
  mutate(
    births_thousands = na_if(births_thousands, "..."),  # convert "..." to NA
    projected_births_2022 = as.numeric(births_thousands) * 1000
  ) %>%
  select(
    location = region_subregion_country_or_area,
    iso3c = iso3_alpha_code,
    projected_births_2022
  )

#Merge all dataset using consistent country identifiers
merged_data <- mortality_status %>%
  left_join(birth_data, by = c("iso3code" = "iso3c"))

final_data <- merged_data %>%
  left_join(unicef_wide, by = c("iso3code" = "iso3c"))

saveRDS(final_data, file = "data/final_data.rds")