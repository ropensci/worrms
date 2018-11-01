context("wm_distribution")

test_that("wm_distribution basic usage works", {
  vcr::use_cassette("wm_distribution", {
    aa <- wm_distribution(id = 156806)
    expect_is(aa, "tbl_df")
    expect_is(aa, "data.frame")
    expect_gt(NROW(aa), 1)
  })
})

test_that("wm_distribution fails well", {
  skip_on_cran()

  expect_error(wm_distribution(), "argument \"id\" is missing")
  expect_error(wm_distribution("asdfafasdfs"), "id must be of class")
  expect_error(wm_distribution(44444), "\\(204\\) No Content")
})



context("wm_distribution_ - plural")

test_that("wm_distribution_ basic usage works", {
  vcr::use_cassette("wm_distribution_", {
    aa <- wm_distribution_(id = 156806)
    expect_is(aa, "tbl_df")
    expect_is(aa, "data.frame")
    expect_gt(NROW(aa), 1)
  })

  vcr::use_cassette("wm_distribution_many", {
    bb <- wm_distribution_(id = c(156806, 126436))
    expect_is(aa, "tbl_df")
    expect_is(aa, "data.frame")
    expect_gt(NROW(bb), NROW(aa))
  }, record = "new_episodes")
})

test_that("wm_distribution_ fails well", {
  skip_on_cran()

  expect_error(wm_distribution_(), "use only one of")
  expect_error(wm_distribution_("asdfafasdfs"), "id must be of class")
  expect_warning(wm_distribution_(44444), "\\(204\\) No Content")
})
