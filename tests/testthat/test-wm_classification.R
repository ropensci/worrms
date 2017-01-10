context("wm_classification")

test_that("wm_classification works", {
  skip_on_cran()

  aa <- wm_classification(id = 105706)

  expect_is(aa, "tbl_df")
  expect_is(aa, "data.frame")
  expect_named(aa, c('AphiaID', 'rank', 'scientificname'))
})

test_that("wm_classification fails well", {
  skip_on_cran()

  expect_error(wm_classification(), "argument \"id\" is missing")
  expect_error(wm_classification("asdfafasdfs"), "id must be of class")

  bb <- wm_classification(23424234)
  expect_equal(NROW(bb), 0)
  expect_equal(length(names(bb)), 0)
})
