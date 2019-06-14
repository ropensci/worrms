#' Get complete AphiaRecord for an AphiaID
#'
#' @export
#' @param id (numeric/integer) one or more AphiaID's.
#' @param name (character) one or more taxonomic names. optional
#' @template curl
#' @template plural
#' @return A data.frame, one record for each id
#' @note `wm_record_` is defunct, `wm_record` can do plural requests now
#' @examples \dontrun{
#' wm_record(id = 105706)
#' wm_record(id = c(105706, 126436))
#' }
wm_record <- function(id, ...) {
  assert(id, c("numeric", "integer"))
  args <- stats::setNames(as.list(id), rep('aphiaids[]', length(id)))
  wm_GET(file.path(wm_base(), "AphiaRecordsByAphiaIDs"),
    query = args, ...)
}

#' @export
#' @rdname wm_record_-defunct
wm_record_ <- function(...) {
  .Defunct("wm_record")
}
