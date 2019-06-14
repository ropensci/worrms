context("wm_ranks_id")
test_that("wm_ranks_id - default usage works", {
  vcr::use_cassette("wm_ranks_id", {
    aa <- wm_ranks_id(220)
  })

  expect_is(aa, "data.frame")
  expect_equal(unique(aa$taxonRankID), 220)
  expect_equal(unique(aa$taxonRank), "Species")
})

test_that("wm_ranks_id fails well", {
  skip_on_cran()

  expect_error(wm_ranks_id(), "argument \"rank_id\" is missing")
  expect_error(wm_ranks_id("asdfafasdfs"), "rank_id must be of class")
  expect_error(wm_ranks_id(1, "asdf"), "aphia_id must be of class")

  vcr::use_cassette("wm_ranks_id_error", {
    expect_error(wm_ranks_id(44444), "\\(204\\) No Content")
  })
})


context("wm_ranks_name")
test_that("wm_ranks_name - default usage works", {
  vcr::use_cassette("wm_ranks_name", {
    aa <- wm_ranks_name("genus")
  })

  expect_is(aa, "data.frame")
  expect_equal(unique(aa$taxonRankID), 180)
  expect_equal(unique(aa$taxonRank), "Genus")
})

test_that("wm_ranks_name fails well", {
  skip_on_cran()

  expect_error(wm_ranks_name(), "argument \"rank_name\" is missing")
  expect_error(wm_ranks_name(1), "rank_name must be of class")
  expect_error(wm_ranks_name("asdf", "asdf"), "aphia_id must be of class")

  vcr::use_cassette("wm_ranks_name_error", {
    expect_error(wm_ranks_name("foobar"), "\\(204\\) No Content")
  })
})
