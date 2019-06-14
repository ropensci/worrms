#' Get synonyms for an AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. For `wm_synonyms` it's required
#' and must be `length(id) == 1`, for `wm_synonyms_` it's optional and
#' can be `length(id) >= 1`
#' @param name (character) one or more taxonomic names. optional
#' @param offset (integer) record to start at. default: 1
#' @template curl
#' @template plural
#' @return A tibble/data.frame. when using underscore method, outputs from
#' each input are binded together, but can be split by `id` column
#' @examples \dontrun{
#' wm_synonyms(id = 105706)
#' wm_synonyms_(id = 105706)
#' wm_synonyms(id = 126436)
#' wm_synonyms(id = 126436, offset = 10)
#' wm_synonyms_(id = c(105706, 126436))
#' }
wm_synonyms <- function(id, offset = 1, ...) {
  assert(id, c("numeric", "integer"))
  assert(offset, c("numeric", "integer"))
  assert_len(id, 1)
  wm_GET(file.path(wm_base(), "AphiaSynonymsByAphiaID", id), 
    query = cc(list(offset = offset)), ...)
}

#' @export
#' @rdname wm_synonyms
wm_synonyms_ <- function(id = NULL, name = NULL, ...) {
  id <- id_name(id, name)
  run_bind(id, wm_synonyms, on_error = warning, ...)
}
