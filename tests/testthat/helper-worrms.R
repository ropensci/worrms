# set up vcr
library("vcr")
vcr::vcr_configure(dir = "../fixtures")
vcr::check_cassette_names()

has_internet <- function() {
  z <- try(suppressWarnings(readLines('https://www.google.com', n = 1)), 
    silent = TRUE)
  !inherits(z, "try-error")
}

skip_if_net_down <- function() {
  if (has_internet()) {
    return()
  }
  testthat::skip("no internet")
}
