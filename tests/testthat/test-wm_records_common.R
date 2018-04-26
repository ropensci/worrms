context("wm_records_common")

test_that("wm_records_common - works", {
  vcr::use_cassette("wm_records_common", {
    aa <- wm_records_common(name = 'dolphin')

    expect_is(aa, "tbl_df")
    expect_is(aa, "data.frame")
    expect_true(any(grepl("AphiaID", names(aa))))
    expect_equal(aa$kingdom, "Animalia")
    expect_equal(aa$genus, "Coryphaena")
  })
})

test_that("wm_records_common - fuzzy parameter works", {
  vcr::use_cassette("wm_records_common_fuzzy_false", {
    aa <- wm_records_common(name = 'dolphin')
    expect_is(aa, "tbl_df")
    expect_is(aa, "data.frame")
  })

  vcr::use_cassette("wm_records_common_fuzzy_true", {
    bb <- wm_records_common(name = 'dolphin', fuzzy = TRUE)
    expect_is(bb, "tbl_df")
    expect_is(bb, "data.frame")
  })

  expect_gt(NROW(bb), NROW(aa))
})

test_that("wm_records_common - offset parameter works", {
  vcr::use_cassette("wm_records_common_offset", {
    aa <- wm_records_common(name = 'dolphin', fuzzy = TRUE)
    bb <- wm_records_common(name = 'dolphin', fuzzy = TRUE, offset = 10)

    expect_false(identical(aa$AphiaID, bb$AphiaID))
  }, record = "new_episodes")
})

test_that("wm_records_common fails well", {
  skip_on_cran()

  expect_error(wm_records_common(), "argument \"name\" is missing")
  expect_error(wm_records_common(55555), "name must be of class character")
  expect_error(wm_records_common("asdfafasdfs"), "\\(204\\) No Content")
})





context("wm_records_common_ - plural")

test_that("wm_records_common_ - works", {
  vcr::use_cassette("wm_records__many", {
    bb <- wm_records_common_(name = c('dolphin', 'clam'))

    expect_is(bb, "tbl_df")
    expect_is(bb, "data.frame")
    expect_true("dolphin" %in% bb$id)
    expect_true("clam" %in% bb$id)
  }, record = "new_episodes")
})

test_that("wm_records_common_ fails well", {
  skip_on_cran()

  expect_error(wm_records_common_(), "argument \"name\" is missing")
  expect_error(wm_records_common_(55555), "name must be of class character")
  expect_error(wm_records_common_("asdfafasdfs"), "\\(204\\) No Content")
})
