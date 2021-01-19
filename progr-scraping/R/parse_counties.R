library(sf)

# url <- "ftp://ftp.pasda.psu.edu/pub/pasda/padot/boundary_layers/PaCounty2020_01.zip"
# download.file(url, destfile = "data/pacounties/PaCounties.zip")
# unzip("data/pacounties/PaCounties.zip", exdir = "data/pacounties")

counties <- st_read("data/pacounties/PaCounty2020_01.shp", quiet = T)
counties_t <- st_transform(counties, st_crs(4269)) %>%
  janitor::clean_names()

saveRDS(counties_t, "data/pacounties/pacounties.rds")