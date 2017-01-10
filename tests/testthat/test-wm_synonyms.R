context("wm_synonyms")

test_that("wm_synonyms - works", {
  skip_on_cran()

  aa <- wm_synonyms(id = 105706)

  expect_is(aa, "tbl_df")
  expect_is(aa, "data.frame")
  expect_equal(NROW(aa), 1)
  expect_true(any(grepl("scientificname", names(aa))))
  expect_true(any(grepl("AphiaID", names(aa))))
  expect_true(any(grepl("valid_AphiaID", names(aa))))
  expect_true(any(grepl("valid_name", names(aa))))
  expect_true(any(grepl("valid_authority", names(aa))))
})

test_that("wm_synonyms fails well", {
  skip_on_cran()

  expect_error(wm_synonyms(), "argument \"id\" is missing")
  expect_error(wm_synonyms(55555), "\\(204\\) No Content")
})
