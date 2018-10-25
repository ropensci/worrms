context("wm_name2id")

test_that("wm_name2id - default usage works", {
  vcr::use_cassette("wm_name2id", {
    aa <- wm_name2id(name = "Rhincodon")

    expect_type(aa, "integer")
    expect_equal(aa, 105749)
  })
})

test_that("wm_name2id fails well", {
  skip_on_cran()

  expect_error(wm_name2id(), "argument \"name\" is missing")
  expect_error(wm_name2id(44444), "name must be of class")
  expect_error(wm_name2id("asdfafasdfs"), "\\(204\\) No Content")
})



context("wm_name2id_ - plural")

test_that("wm_name2id_ - default usage works", {
  vcr::use_cassette("wm_name2id_", {
    aa <- wm_name2id_(name = "Rhincodon")
    expect_type(aa, "list")
    expect_named(aa, "Rhincodon")
  })

  vcr::use_cassette("wm_name2id_many", {
    bb <- wm_name2id_(name = c("Rhincodon", "Gadus morhua"))
    expect_type(bb, "list")
    expect_type(bb[[1]], "integer")
    expect_named(bb, c("Rhincodon", "Gadus morhua"))
  }, record = "all")
})

test_that("wm_name2id_ fails well", {
  skip_on_cran()

  expect_error(wm_name2id_(), "argument \"name\" is missing")
  expect_error(wm_name2id_(44444), "name must be of class")
  expect_warning(wm_name2id_("asdfafasdfs"), "\\(204\\) No Content")
})
