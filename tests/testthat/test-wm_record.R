context("wm_record")

test_that("wm_record - default usage works", {
  vcr::use_cassette("wm_record", {
    aa <- wm_record(id = 105706)

    expect_type(aa, "list")
    expect_equal(aa$valid_name, "Rhincodontidae")
    expect_equal(aa$valid_AphiaID, 105706)
  })
})

test_that("wm_record fails well", {
  skip_on_cran()

  expect_error(wm_record(), "argument \"id\" is missing")
  expect_error(wm_record("asdfafasdfs"), "id must be of class")
  expect_error(wm_record(44444), "\\(204\\) No Content")
})




context("wm_record_ - plural")

test_that("wm_record_ - default usage works", {
  vcr::use_cassette("wm_record_", {
    aa <- wm_record_(id = 105706)

    expect_type(aa, "list")
    expect_equal(aa$`105706`$valid_name, "Rhincodontidae")
    expect_equal(aa$`105706`$valid_AphiaID, 105706)
  })

  vcr::use_cassette("wm_record_many", {
    bb <- wm_record_(id = c(105706, 126436))

    expect_type(bb, "list")
    expect_named(bb, c('105706', '126436'))
  }, record = "all")
})

test_that("wm_record_ fails well", {
  skip_on_cran()

  expect_error(wm_record_(), "use only one of")
  expect_error(wm_record_("asdfafasdfs"), "id must be of class")
  expect_error(wm_record_(44444), "\\(204\\) No Content")
})
