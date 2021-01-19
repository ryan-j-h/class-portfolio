# load packages
library(tidyverse)
library(sf)

# read in data
sheetz_raw <- readRDS("data/sheetz/sheetz_raw.rds")

# tidy data and convert to spatial object
sheetz_sf <- sheetz_raw %>% 
  select(store_number, address, city, state, latitude, longitude) %>% 
  filter(state == "PA") %>% 
  st_as_sf(coords = c("longitude", "latitude")) %>% 
  st_set_crs(value = 4269)
  

# save data
saveRDS(sheetz_sf, "data/sheetz/sheetz.rds")