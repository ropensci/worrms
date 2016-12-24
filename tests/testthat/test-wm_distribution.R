context("wm_distribution")

test_that("wm_distribution basic usage works", {
  skip_on_cran()

  aa <- wm_distribution(id = 156806)
  expect_is(aa, "tbl_df")
  expect_is(aa, "data.frame")
  expect_gt(NROW(aa), 1)
})

test_that("wm_distribution fails well", {
  skip_on_cran()

  expect_error(wm_distribution(), "argument \"id\" is missing")
  expect_error(wm_distribution("asdfafasdfs"), "id must be of class")
  expect_error(wm_distribution(44444), "No Content")
})
