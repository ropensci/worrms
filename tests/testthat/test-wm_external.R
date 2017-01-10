context("wm_external")

test_that("wm_external - default usage works", {
  skip_on_cran()

  aa <- wm_external(id = 1080)

  expect_type(aa, "integer")
  expect_equal(aa, 85257)
})

test_that("wm_external - type: fishbase", {
  skip_on_cran()

  aa <- wm_external(id = 278468, type = "fishbase")

  expect_type(aa, "integer")
  expect_equal(aa, 8399)
})

test_that("wm_external fails well", {
  skip_on_cran()

  expect_error(wm_external(), "argument \"id\" is missing")
  expect_error(wm_external("asdfafasdfs"), "id must be of class")
  expect_error(wm_external(44444), "\\(204\\) No Content")
})
