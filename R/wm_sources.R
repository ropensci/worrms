#' Get sources for an AphiaID
#'
#' @export
#' @param id an AphiaID
#' @template curl
#' @examples
#' wm_sources(id = 105706)
wm_sources <- function(id, ...) {
  wm_GET(file.path(wm_base(), "AphiaSourcesByAphiaID", id), ...)
}
