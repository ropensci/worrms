context("wm_name2id")

test_that("wm_name2id - default usage works", {
  skip_on_cran()

  aa <- wm_name2id(name = "Rhincodon")

  expect_type(aa, "integer")
  expect_equal(aa, 105749)
})

test_that("wm_name2id fails well", {
  skip_on_cran()

  expect_error(wm_name2id(), "argument \"name\" is missing")
  expect_error(wm_name2id(44444), "name must be of class")
  expect_error(wm_name2id("asdfafasdfs"), "\\(204\\) No Content")
})
