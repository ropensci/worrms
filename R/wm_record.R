#' Get complete AphiaRecord for an AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. For \code{wm_record} it's
#' required and must be \code{length(id) = 1}, for \code{wm_record_} it's
#' optional and can be \code{length(id) >= 1}
#' @param name (character) one or more taxonomic names. optional
#' @template curl
#' @template plural
#' @examples
#' wm_record(id = 105706)
#' wm_record_(id = c(105706, 126436))
wm_record <- function(id, ...) {
  assert(id, c("numeric", "integer"))
  wm_GET(file.path(wm_base(), "AphiaRecordByAphiaID", id), ...)
}

#' @export
#' @rdname wm_record
wm_record_ <- function(id = NULL, name = NULL, ...) {
  id <- id_name(id, name)
  run_c(id, wm_record, ...)
}
