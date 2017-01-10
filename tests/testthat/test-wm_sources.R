context("wm_sources")

test_that("wm_sources - works", {
  skip_on_cran()

  aa <- wm_sources(id = 105706)

  expect_is(aa, "tbl_df")
  expect_is(aa, "data.frame")
  expect_true(any(grepl("use", names(aa))))
  expect_true(any(grepl("reference", names(aa))))
  expect_true(any(grepl("page", names(aa))))
  expect_true(any(grepl("url", names(aa))))
})

test_that("wm_sources fails well", {
  skip_on_cran()

  expect_error(wm_sources(), "argument \"id\" is missing")
  expect_error(wm_sources(55555), "\\(204\\) No Content")
})
