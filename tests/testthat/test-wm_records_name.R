context("wm_records_name")

test_that("wm_records_name - fuzzy TRUE", {
  vcr::use_cassette("wm_records_name", {
    aa <- wm_records_name(name = 'Coryphaena im')

    expect_is(aa, "tbl_df")
    expect_is(aa, "data.frame")
    expect_true(any(grepl("Coryphaena imperialis", aa$scientificname)))
    expect_true(any(grepl("Coryphaena immaculata", aa$scientificname)))
    expect_equal(NROW(aa), 2)
  })
})

test_that("wm_records_name - fuzzy FALSE", {
  vcr::use_cassette("wm_records_name_fuzzy", {
    aa <- wm_records_name(name = 'Coryphaena imperialis', fuzzy = FALSE)

    expect_is(aa, "tbl_df")
    expect_is(aa, "data.frame")
    expect_true(all(grepl("Coryphaena imperialis", aa$scientificname)))
    expect_equal(NROW(aa), 1)
  })
})

test_that("wm_records_name fails well", {
  skip_on_cran()

  expect_error(wm_records_name(), "argument \"name\" is missing")
  expect_error(wm_records_name(55555), "name must be of class character")
  expect_error(wm_records_name("asdfs", "Adf"), "fuzzy must be of class logical")
  expect_error(wm_records_name("asdfs", marine_only = 5), "marine_only must be of class logical")
  expect_error(wm_records_name("asdfs", offset = "foobar"), "offset must be of class numeric, integer")
})
