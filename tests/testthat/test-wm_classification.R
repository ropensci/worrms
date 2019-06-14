context("wm_classification")

test_that("wm_classification works", {
  vcr::use_cassette("wm_classification", {
    aa <- wm_classification(id = 105706)

    expect_is(aa, "tbl_df")
    expect_is(aa, "data.frame")
    expect_named(aa, c('AphiaID', 'rank', 'scientificname'))
  })
})

test_that("wm_classification fails well", {
  skip_on_cran()

  expect_error(wm_classification(), "argument \"id\" is missing")
  expect_error(wm_classification("asdfafasdfs"), "id must be of class")
  expect_error(wm_classification(23424234), "No Content")
})


context("wm_classification - plural")

test_that("wm_classification_ works", {
  # singular works
  vcr::use_cassette("wm_classification_", {
    aa <- wm_classification_(id = 105706)
    expect_is(aa, "tbl_df")
    expect_is(aa, "data.frame")
    expect_named(aa, c('id', 'AphiaID', 'rank', 'scientificname'))
  })

  # many works
  vcr::use_cassette("wm_classification_many", {
    bb <- wm_classification_(id = c(254967, 344089))
    expect_is(bb, "tbl_df")
    expect_is(bb, "data.frame")
    expect_named(bb, c('id', 'AphiaID', 'rank', 'scientificname'))
  })
})

test_that("wm_classification_ fails well", {
  skip_on_cran()

  expect_error(wm_classification_(), "use only one of")
  expect_error(wm_classification_("asdfafasdfs"), "id must be of class")
})
