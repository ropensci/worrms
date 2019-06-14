context("wm_record")
test_that("wm_record - default usage works", {
  vcr::use_cassette("wm_record", {
    aa <- wm_record(id = 105706)
  })

  expect_type(aa, "list")
  expect_equal(aa$valid_name, "Rhincodontidae")
  expect_equal(aa$valid_AphiaID, 105706)
})

test_that("wm_record fails well", {
  skip_on_cran()

  expect_error(wm_record(), "argument \"id\" is missing")
  expect_error(wm_record("asdfafasdfs"), "id must be of class")

  vcr::use_cassette("wm_record_error", {
    expect_error(wm_record(44444), "\\(204\\) No Content")
  })
})


context("wm_record - plural")
test_that("wm_record - default usage works", {
  vcr::use_cassette("wm_record_plural_plural", {
    bb <- wm_record(id = c(105706, 126436))
  })

  expect_is(bb, "data.frame")
  expect_equal(bb$AphiaID, c(105706, 126436))
})



context("wm_record_ - defunct")
test_that("wm_record_ - default usage works", {
    expect_error(wm_record_(id = 105706), "defunct", class = "error")
})
