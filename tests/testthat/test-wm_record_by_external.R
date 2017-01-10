context("wm_record_by_external")

test_that("wm_record_by_external - default - by id type tsn", {
  skip_on_cran()

  # tsn
  tsn <- wm_record_by_external(id = 85257)
  expect_type(tsn, "list")
  expect_equal(tsn$valid_name, "Copepoda")
  expect_equal(tsn$valid_AphiaID, 1080)

  # ncbi
  ncbi <- wm_record_by_external(id = 6830, type = "ncbi")
  expect_type(ncbi, "list")
  expect_equal(ncbi$valid_name, "Copepoda")
  expect_equal(ncbi$valid_AphiaID, 1080)

  # they're equivvalent
  expect_identical(tsn, ncbi)

  # fishbase
  fishbase <- wm_record_by_external(id = 8399, type = "fishbase")
  expect_type(fishbase, "list")
  expect_equal(fishbase$valid_name, "Callorhinchus callorynchus")
  expect_equal(fishbase$valid_AphiaID, 278468)

})

test_that("wm_record_by_external fails well", {
  skip_on_cran()

  expect_error(wm_record_by_external(), "argument \"id\" is missing")
  expect_error(wm_record_by_external("asdfafasdfs"), "id must be of class")
})
