#' Get the AphiaRecords for a given taxonRankID
#'
#' @export
#' @param rank_id (numeric/integer) a rank id
#' @param id (character) a single AphiaID
#' @param offset (integer) record to start at. default: 1
#' @template curl
#' @template plural
#' @return A tibble/data.frame. when using underscore method, outputs from
#' each input are binded together, but can be split by `id` column
#' @examples \dontrun{
#' wm_records_rank(rank_id = 180, id = 106776)
#' wm_records_rank(rank_id = 180, id = 106776, offset = 50)
#' }
wm_records_rank <- function(rank_id, id = NULL, offset = 1, ...) {
  assert(rank_id, c("numeric", "integer"))
  assert(id, c("numeric", "integer"))
  assert(offset, c("numeric", "integer"))
  assert_len(rank_id, 1)
  assert_len(id, 1)
  wm_GET(file.path(wm_base(), "AphiaRecordsByTaxonRankID", rank_id), 
    query = cc(list(belongsTo = id, offset = offset)), ...)
}
