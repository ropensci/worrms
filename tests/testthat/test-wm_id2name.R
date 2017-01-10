context("wm_id2name")

test_that("wm_id2name - default usage works", {
  skip_on_cran()

  aa <- wm_id2name(id = 1080)

  expect_type(aa, "character")
  expect_equal(aa, "Copepoda")
})

test_that("wm_id2name fails well", {
  skip_on_cran()

  expect_error(wm_id2name(), "argument \"id\" is missing")
  expect_error(wm_id2name("asdfafasdfs"), "id must be of class")
  expect_error(wm_id2name(44444), "\\(204\\) No Content")
})
