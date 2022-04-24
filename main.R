# set up as git project
# 1) run install.packages("usethis"), then
# 2) run library(usethis), then
# 3) https://fredaccount.stlouisfed.org/apikey to request API key, then
# 4) copy the provided key to clipboard, then
# 5) run usethis::edit_r_environ(), then
# 6) in the just opened .Renviron file, add: FRED_API_KEY=<paste the key you copied in step 4>, then
# 7) save everything, then
# 8) restart R & RStudio


rm(list=ls())
library(tidyverse)
library(fredr)

# to make this interactive, prompt the user for the acronym
# for the FRED data file they wish to download....

tbl_obfr <- tibble( fredr("obfr") )
tbl_obfr <- select( tbl_obfr, c("date", "value"))
tbl_obfr <- rename( tbl_obfr, rate = value )
# just because
write_csv( tbl_obfr, 'obfr.csv')

plot_fedrate <- ggplot( data = tbl_obfr, aes( x = date, y = rate ) ) +
                  ggtitle( "Federal Overnight Funds Rate") +
                  xlab("Date") +
                  ylab("% Rate") +
                  geom_line( colour = "purple" )

plot_fedrate
