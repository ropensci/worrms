context("wm_classification")

test_that("wm_classification works", {
  skip_on_cran()

  aa <- wm_classification(id = 105706)

  expect_is(aa, "list")
  expect_named(aa, c('AphiaID', 'rank', 'scientificname', 'child'))
})

test_that("wm_classification fails well", {
  skip_on_cran()

  expect_error(wm_classification(), "argument \"id\" is missing")
  expect_error(wm_classification("asdfafasdfs"), "id must be of class")
  expect_equal(length(wm_classification(23424234)$child), 0)
})
