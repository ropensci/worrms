context("wm_synonyms")

test_that("wm_synonyms - works", {
  vcr::use_cassette("wm_synonyms", {
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
})

test_that("wm_synonyms fails well", {
  skip_on_cran()

  expect_error(wm_synonyms(), "argument \"id\" is missing")
  expect_error(wm_synonyms(55555), "\\(204\\) No Content")
})



context("wm_synonyms_ - plural")

test_that("wm_synonyms_ - works", {
  vcr::use_cassette("wm_synonyms__many", {
    aa <- wm_synonyms_(id = c(105706, 126436))

    expect_is(aa, "tbl_df")
    expect_is(aa, "data.frame")
    expect_true('105706' %in% aa$id)
    expect_true('126436' %in% aa$id)
  }, record = "new_episodes")
})

test_that("wm_synonyms_ fails well", {
  skip_on_cran()

  expect_error(wm_synonyms_(), "use only one of")
  expect_warning(wm_synonyms_(55555), "\\(204\\) No Content")
})
