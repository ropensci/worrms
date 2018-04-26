context("wm_common_id")

test_that("wm_common_id basic usage works", {
  vcr::use_cassette("wm_common_id", {
    aa <- wm_common_id(id = 156806)
    expect_is(aa, "tbl_df")
    expect_is(aa, "data.frame")
    expect_named(aa, c('vernacular', 'language_code', 'language'))
    expect_match(aa$vernacular, "clam")
  })
})

test_that("wm_common_id fails well", {
  skip_on_cran()

  expect_error(wm_common_id(), "argument \"id\" is missing")
  expect_error(wm_common_id("asdfafasdfs"), "id must be of class")
  expect_error(wm_common_id(44444), "\\(204\\) No Content")
})


context("wm_common_id_ - plural")

test_that("wm_common_id_ basic usage works", {
  # singular
  vcr::use_cassette("wm_common_id_", {
    aa <- wm_common_id_(id = 156806)
    expect_is(aa, "tbl_df")
    expect_is(aa, "data.frame")
    expect_named(aa, c('id', 'vernacular', 'language_code', 'language'))
    expect_match(aa$vernacular, "clam")
  })

  # plural
  vcr::use_cassette("wm_common_id_many", {
    bb <- wm_common_id_(id = c(105706, 156806, 397065))
    expect_is(bb, "tbl_df")
    expect_is(bb, "data.frame")
    expect_named(bb, c('id', 'vernacular', 'language_code', 'language'))
    expect_gt(NROW(bb), NROW(aa))
  }, record = "new_episodes")
})

test_that("wm_common_id_ fails well", {
  skip_on_cran()

  expect_error(wm_common_id_(), "use only one of")
  expect_error(wm_common_id_("asdfafasdfs"), "id must be of class")
  expect_error(wm_common_id_(44444), "\\(204\\) No Content")
})
