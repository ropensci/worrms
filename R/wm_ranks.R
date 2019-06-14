#' Get taxonomic ranks by their identifier
#'
#' @export
#' @param rank_id (numeric/integer) a rank identifier. length==1
#' @param rank_name (character) a rank name. length==1
#' @param id an AphiaID. length==1
#' @template curl
#' @return A tibble/data.frame
#' @examples \dontrun{
#' wm_ranks_id(220)
#' wm_ranks_id(180)
#' wm_ranks_id(180, id = 4)
#' 
#' wm_ranks_name("genus")
#' wm_ranks_name("genus", id = 4)
#' }
wm_ranks_id <- function(rank_id, id = NULL, offset = 1, ...) {
  assert(rank_id, c("numeric", "integer"))
  assert(id, c("numeric", "integer"))
  assert_len(rank_id, 1)
  assert_len(id, 1)
  wm_GET(file.path(wm_base(), "AphiaTaxonRanksByID", rank_id),
    query = cc(list(AphiaID = id)), ...)
}

#' @export
#' @rdname wm_ranks
wm_ranks_name <- function(rank_name, id = NULL, offset = 1, ...) {
  assert(rank_name, c("character"))
  assert(id, c("numeric", "integer"))
  assert_len(rank_name, 1)
  assert_len(id, 1)
  wm_GET(file.path(wm_base(), "AphiaTaxonRanksByName", rank_name),
    query = cc(list(AphiaID = id)), ...)
}
