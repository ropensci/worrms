context("wm_record_by_external")

test_that("wm_record_by_external - default - by id type tsn", {
  # tsn
  vcr::use_cassette("wm_record_by_external_tsn", {
    tsn <- wm_record_by_external(id = 85257)
    expect_type(tsn, "list")
    expect_equal(tsn$valid_name, "Copepoda")
    expect_equal(tsn$valid_AphiaID, 1080)
  })

  # ncbi
  vcr::use_cassette("wm_record_by_external_ncbi", {
    ncbi <- wm_record_by_external(id = 6830, type = "ncbi")
    expect_type(ncbi, "list")
    expect_equal(ncbi$valid_name, "Copepoda")
    expect_equal(ncbi$valid_AphiaID, 1080)
  })

  # they're equivvalent
  expect_identical(tsn, ncbi)

  # fishbase
  vcr::use_cassette("wm_record_by_external_fishbase", {
    fishbase <- wm_record_by_external(id = 8399, type = "fishbase")
    expect_type(fishbase, "list")
    expect_equal(fishbase$valid_name, "Callorhinchus callorynchus")
    expect_equal(fishbase$valid_AphiaID, 278468)
  })
})

test_that("wm_record_by_external fails well", {
  skip_on_cran()

  expect_error(wm_record_by_external(), "argument \"id\" is missing")
  expect_error(wm_record_by_external("asdfafasdfs"), "id must be of class")
})



context("wm_record_by_external_ - plural")

test_that("wm_record_by_external_ - default - by id type tsn", {
  # singluar
  vcr::use_cassette("wm_record_by_external__tsn", {
    tsn <- wm_record_by_external_(id = 85257)
    expect_type(tsn, "list")
    expect_named(tsn, "85257")
  })

  # many
  vcr::use_cassette("wm_record_by_external__many", {
    bb <- wm_record_by_external_(id = c(85257, 159854))
    expect_is(bb, "list")
    expect_named(bb, c("85257", "159854"))
  })
})

test_that("wm_record_by_external_ fails well", {
  skip_on_cran()

  expect_error(wm_record_by_external_(), "use only one of")
  expect_error(wm_record_by_external_("asdfafasdfs"), "id must be of class")
})
