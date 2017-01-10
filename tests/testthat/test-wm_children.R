context("wm_children")

test_that("wm_children basic usage works", {
  skip_on_cran()

  aa <- wm_children(id = 105706)
  expect_is(aa, "tbl_df")
  expect_is(aa, "data.frame")
  expect_gt(NROW(aa), 1)

  expect_equal(unique(aa$family), "Rhincodontidae")
  expect_equal(unique(aa$order), "Orectolobiformes")
  expect_equal(unique(aa$class), "Elasmobranchii")
  expect_equal(unique(aa$phylum), "Chordata")
  expect_equal(unique(aa$kingdom), "Animalia")
})

test_that("wm_children - marine_only usage works", {
  skip_on_cran()

  expect_is(wm_children(id = 105706, FALSE), "tbl_df")
  expect_is(wm_children(id = 105706, TRUE), "tbl_df")
})

test_that("wm_children - offset parameter works", {
  skip_on_cran()

  off1 <- wm_children(id = 105706, offset = 1)
  off2 <- wm_children(id = 105706, offset = 2)

  expect_equal(off1$AphiaID[1], 297110)
  expect_equal(off2$AphiaID[1], 398065)
})

test_that("wm_children fails well", {
  skip_on_cran()

  expect_error(wm_children(), "argument \"id\" is missing")
  expect_error(wm_children("asdfafasdfs"), "id must be of class")
  expect_error(wm_children(44444), "\\(204\\) No Content")
})
