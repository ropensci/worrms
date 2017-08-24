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





context("wm_external_ - plural")

test_that("wm_external_ - default usage works", {
  skip_on_cran()

  aa <- wm_external_(id = 1080)
  expect_type(aa, "list")
  expect_type(aa[[1]], "integer")
  expect_equal(aa[[1]], 85257)

  bb <- wm_external_(id = c(1080, 126436))
  expect_type(bb, "list")
  expect_named(bb, c('1080', '126436'))
})

test_that("wm_external_ fails well", {
  skip_on_cran()

  expect_error(wm_external_(), "use only one of")
  expect_error(wm_external_("asdfafasdfs"), "id must be of class")
  expect_error(wm_external_(44444), "\\(204\\) No Content")
})
