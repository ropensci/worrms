#' Get complete AphiaRecord for an AphiaID
#'
#' @export
#' @param id an AphiaID
#' @template curl
#' @examples
#' wm_record(id = 105706)
wm_record <- function(id, ...) {
  wm_GET(file.path(wm_base(), "AphiaRecordByAphiaID", id), ...)
}
