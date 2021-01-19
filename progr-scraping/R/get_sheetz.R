# load packages
library(tidyverse)
library(rvest)
library(jsonlite)

# read homepage
regions_url <- "http://www2.stat.duke.edu/~sms185/data/fuel/bystore/zteehs/regions.html"
regions_html <- read_html(regions_url)

# scrape homepage for section urls
section_urls <- regions_html %>% 
  html_nodes(".col-md-2 a") %>%
  html_attr("href") %>%
  .[str_detect(., "www2.stat.duke.edu")] # only keep links from DukeStat domain


# define function to scrape info for all stores in a given section
get_sheetz <- function(section_n) {
  section_n_url <- section_urls[section_n]

  # read section page and convert to list
  section_n_list <- read_html(section_n_url) %>% 
    html_nodes("body") %>% 
    html_text() %>% 
    parse_json()
  
  # define helper function to convert an individual store's list to a row
  store_to_row <- function(store_index) {
    store_list <- section_n_list[[store_index]] %>%
      unlist()
    
    if(length(store_list) != 0) { # make sure list is not empty
      as.matrix(store_list) %>%
        t() %>%
        as.data.frame(stringsAsFactors = F) %>%
        janitor::clean_names()
    }
  }
  
  # construct dataframe of all stores in a section
  section <- map_dfr(1:length(section_n_list), store_to_row)
  
  # space out function calls
  Sys.sleep(rnorm(1, 0.5, 0.1))
  
  return(section)
}

# scrape all 10 sections
sheetz <- map_df(1:10, get_sheetz)

# save data
saveRDS(sheetz, file = "data/sheetz/sheetz_raw.rds")  
