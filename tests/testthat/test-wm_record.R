context("wm_record")

test_that("wm_record - default usage works", {
  skip_on_cran()

  aa <- wm_record(id = 105706)

  expect_type(aa, "list")
  expect_equal(aa$valid_name, "Rhincodontidae")
  expect_equal(aa$valid_AphiaID, 105706)
})

test_that("wm_record fails well", {
  skip_on_cran()

  expect_error(wm_record(), "argument \"id\" is missing")
  expect_error(wm_record("asdfafasdfs"), "id must be of class")
  expect_error(wm_record(44444), "\\(204\\) No Content")
})
