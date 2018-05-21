context("wm_records_date")

test_that("wm_records_date - works", {
  vcr::use_cassette("wm_records_date", {
    # a_date <- format(Sys.Date() - 1, "%Y-%m-%dT%H:%M:%S+00:00")
    a_date = '2018-04-29T00:00:00+00:00'
    aa <- wm_records_date(a_date)

    expect_is(aa, "tbl_df")
    expect_is(aa, "data.frame")
    expect_true(all(grepl(format(Sys.Date(), "%Y"), aa$modified)))
  })
})

test_that("wm_records_date fails well", {
  skip_on_cran()

  expect_error(wm_records_date(), 
    "argument \"start_date\" is missing")
  expect_error(wm_records_date(55555), 
    "start_date must be of class character")
})
