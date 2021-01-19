# load packages
library(tidyverse)
library(rvest)
library(jsonlite)

# set base url and create vector of potential store numbers
base_url <- "http://www2.stat.duke.edu/~sms185/data/fuel/bystore/awaw/awawstore="
store_numbers <- formatC(c(0:1000, 8000:9000), 
                         width = 5, format = "d", flag = "0")

# define function to convert store info to row
get_wawa <- function (store_number) {
  url <- str_c(base_url, store_number, ".json")
  row <- read_json(url) %>%
    unlist() %>%
    as.matrix() %>%
    t() %>%
    as.data.frame(stringsAsFactors = F) %>%
    janitor::clean_names()
  
  # space out function calls
  Sys.sleep(rnorm(1, 0.1, 0.01))
  
  return(row)
}

# make robust to blank webpages
safe_wawa <- safely(get_wawa)

# iterate over all potential store numbers
wawa <- map(store_numbers, safe_wawa) %>% 
  map_dfr("result")

# save data
saveRDS(wawa, file = "data/wawa/wawa_raw.rds") 