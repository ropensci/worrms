# set up vcr
library("vcr")
invisible(
  vcr::vcr_configure(
    dir = "../fixtures/vcr_cassettes", 
    log = TRUE, 
    log_opts = list(file = "vcr.log", log_prefix = "Cassette")
  )
)
