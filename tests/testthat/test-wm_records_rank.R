context("wm_records_rank")
test_that("wm_records_rank - default usage works", {
  vcr::use_cassette("wm_records_rank", {
    aa <- wm_records_rank(rank_id = 180, id = 106776)
  })

  expect_is(aa, "data.frame")
  expect_equal(unique(aa$taxonRankID), 180)
})

test_that("wm_records_rank fails well", {
  skip_on_cran()

  expect_error(wm_records_rank(), "argument \"rank_id\" is missing")
  expect_error(wm_records_rank("asdfafasdfs"), "rank_id must be of class")
  expect_error(wm_records_rank(1, "asdf"), "id must be of class")

  vcr::use_cassette("wm_records_rank_error", {
    expect_error(wm_records_rank(44444), "\\(204\\) No Content",
      class = "error")
  })
})
