context("wm_sources")

test_that("wm_sources - works", {
  vcr::use_cassette("wm_sources", {
    aa <- wm_sources(id = 105706)

    expect_is(aa, "tbl_df")
    expect_is(aa, "data.frame")
    expect_true(any(grepl("use", names(aa))))
    expect_true(any(grepl("reference", names(aa))))
    expect_true(any(grepl("page", names(aa))))
    expect_true(any(grepl("url", names(aa))))
  })
})

test_that("wm_sources fails well", {
  skip_on_cran()

  expect_error(wm_sources(), "argument \"id\" is missing")
  expect_error(wm_sources(55555), "\\(204\\) No Content")
})



context("wm_sources_ - plural")

test_that("wm_sources_ - works", {
  vcr::use_cassette("wm_sources__many", {
    aa <- wm_sources_(id = c(105706, 126436))
    expect_is(aa, "tbl_df")
    expect_is(aa, "data.frame")
    expect_true('105706' %in% aa$id)
    expect_true('126436' %in% aa$id)
  }, record = "new_episodes")
})

test_that("wm_sources_ fails well", {
  skip_on_cran()

  expect_error(wm_sources_(), "use only one of")
  expect_warning(wm_sources_(55555), "\\(204\\) No Content")
})
