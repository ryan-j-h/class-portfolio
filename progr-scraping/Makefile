.PHONY: all

all: hw3.html

hw3.html: hw3.Rmd hw3.css data/sheetz/sheetz.rds data/wawa/wawa.rds data/pacounties/pacounties.rds
		Rscript -e "library(rmarkdown); render('hw3.Rmd')"

data/sheetz/sheetz.rds: R/parse_sheetz.R data/sheetz/sheetz_raw.rds
		Rscript $<

data/sheetz/sheetz_raw.rds: R/get_sheetz.R
		Rscript $<
		
data/wawa/wawa.rds: R/parse_wawa.R data/wawa/wawa_raw.rds
		Rscript $<
		
data/wawa/wawa_raw.rds: R/get_wawa.R
		Rscript $<
		
data/pacounties/pacounties.rds: R/parse_counties.R
		Rscript $<

.PHONY: clean_html clean_data

clean_html:
		rm *.html

clean_data:
		cd data/sheetz; rm *.rds; cd ..; 
		cd data/wawa; rm *.rds; cd ..; 
		cd data/pacounties; rm *.rds