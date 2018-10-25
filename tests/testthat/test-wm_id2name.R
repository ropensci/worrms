context("wm_id2name")

test_that("wm_id2name - default usage works", {
  vcr::use_cassette("wm_id2name", {
    aa <- wm_id2name(id = 1080)

    expect_type(aa, "character")
    expect_equal(aa, "Copepoda")
  })
})

test_that("wm_id2name fails well", {
  skip_on_cran()

  expect_error(wm_id2name(), "argument \"id\" is missing")
  expect_error(wm_id2name("asdfafasdfs"), "id must be of class")
  expect_error(wm_id2name(44444), "\\(204\\) No Content")
})




context("wm_id2name_ - plural")

test_that("wm_id2name_ - default usage works", {
  vcr::use_cassette("wm_id2name_", {
    aa <- wm_id2name_(id = 1080)
    expect_type(aa, "list")
    expect_type(aa[[1]], "character")
    expect_equal(aa[[1]], "Copepoda")
  })

  vcr::use_cassette("wm_id2name_many", {
    bb <-  wm_id2name_(id = c(105706, 126436))
    expect_type(bb, "list")
    expect_equal(length(bb), 2)
    expect_named(bb, c('105706', '126436'))
  }, record = "new_episodes")
})

test_that("wm_id2name_ fails well", {
  skip_on_cran()

  expect_error(wm_id2name_(), "argument \"id\" is missing")
  expect_error(wm_id2name_("asdfafasdfs"), "id must be of class")
  expect_warning(wm_id2name_(44444), "\\(204\\) No Content")
})
