context("wm_common_id")

test_that("wm_common_id basic usage works", {
  skip_on_cran()

  aa <- wm_common_id(id = 156806)
  expect_is(aa, "tbl_df")
  expect_is(aa, "data.frame")
  expect_named(aa, c('vernacular', 'language_code', 'language'))
  expect_match(aa$vernacular, "clam")
})

test_that("wm_common_id fails well", {
  skip_on_cran()

  expect_error(wm_common_id(), "argument \"id\" is missing")
  expect_error(wm_common_id("asdfafasdfs"), "id must be of class")
  expect_error(wm_common_id(44444), "\\(204\\) No Content")
})
