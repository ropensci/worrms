#' Get complete AphiaRecord for an AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. required.
#' @template curl
#' @examples
#' wm_record(id = 105706)
wm_record <- function(id, ...) {
  assert(id, c("numeric", "integer"))
  wm_GET(file.path(wm_base(), "AphiaRecordByAphiaID", id), ...)
}
