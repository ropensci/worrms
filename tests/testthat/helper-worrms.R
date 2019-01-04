# set up vcr
library("vcr")
invisible(vcr::vcr_configure(dir = "../fixtures/vcr_cassettes"))

has_internet <- function() {
  !is.null(suppressWarnings(utils::nsl("www.google.com")))
}

skip_if_net_down <- function() {
  if (has_internet()) {
    return()
  }
  testthat::skip("no internet")
}
