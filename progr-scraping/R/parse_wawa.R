# load packages
library(tidyverse)
library(sf)

# read in data
wawa_raw <- readRDS("data/wawa/wawa_raw.rds")

# tidy data and convert to spatial object
wawa_sf <- wawa_raw %>% 
  select(store_number = location_id, 
         address = addresses_address, 
         city = addresses_city, 
         state = addresses_state, 
         addresses_loc1, 
         addresses_loc2) %>%
  filter(state == "PA") %>% 
  st_as_sf(coords = c("addresses_loc2", "addresses_loc1")) %>%
  st_set_crs(value = 4269)


# save data
saveRDS(wawa_sf, "data/wawa/wawa.rds")