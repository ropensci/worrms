context("wm_records_taxamatch")

test_that("wm_records_taxamatch basic usage works", {
  vcr::use_cassette("wm_records_taxamatch", {
    aa <- wm_records_taxamatch(name = 'Coryphaena immaculata')

    expect_is(aa, "list")
    expect_equal(length(aa), 1)
    expect_is(aa[[1]], "tbl_df")
    expect_is(aa[[1]], "data.frame")
    expect_equal(NROW(aa[[1]]), 1)
  })
})

test_that("wm_records_taxamatch fails well", {
  skip_on_cran()

  expect_error(wm_records_taxamatch(), "argument \"name\" is missing")
  expect_error(wm_records_taxamatch("asdfafasdfs"), "No Content")
  expect_error(wm_records_taxamatch(5),
               "name must be of class character")
  expect_error(wm_records_taxamatch('Platanista gangetica', marine_only = 5),
               "marine_only must be of class logical")
})

test_that("wm_records_taxamatch result length matches input", {
  skip_on_cran()

  suppressWarnings(expect_equal(length(wm_records_taxamatch("asdfs", on_error = warning)), 1))
  suppressWarnings(expect_equal(length(wm_records_taxamatch(c("asdfs", "qwerq"), on_error = warning)), 2))
})
