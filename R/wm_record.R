#' Get complete AphiaRecord for an AphiaID
#'
#' @export
#' @param id (numeric/integer) one or more AphiaID's.
#' @template curl
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

#' Get complete AphiaRecord for an AphiaID - plural version
#' @export
#' @details This function is defunct - see [wm_record()]
#' @param ... ignored
#' @rdname wm_record_-defunct
wm_record_ <- function(...) {
  .Defunct("wm_record")
}
