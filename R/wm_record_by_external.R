#' Get record by external ID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. For `wm_record_by_external`
#' it's required and must be `length(id) = 1`, for
#' `wm_record_by_external_` it's optional and can be `length(id) >= 1`
#' @param type (character) the type of external id. one of: tsn, bold,
#' dyntaxa, eol, fishbase, iucn, lsid, ncbi, gisd. default: tsn
#' @param name (character) one or more taxonomic names. optional
#' @template curl
#' @template plural
#' @return A named list. When using underscore method, each output is named
#' by the input ID, and can be separated by the list names
#' @examples
#' wm_record_by_external(id = 85257)
#' wm_record_by_external(id = 159854)
#'
#' wm_record_by_external_(id = c(85257, 159854))
wm_record_by_external <- function(id, type = "tsn", ...) {
  assert(id, c("numeric", "integer"))
  assert(type, "character")
  wm_GET(file.path(wm_base(), "AphiaRecordByExternalID", id),
         query = cc(list(type = type)), ...)
}

#' @export
#' @rdname wm_record_by_external
wm_record_by_external_ <- function(id = NULL, name = NULL, type = "tsn", ...) {
  id <- id_name(id, name)
  run_c(id, wm_record_by_external, type = type, ...)
}
