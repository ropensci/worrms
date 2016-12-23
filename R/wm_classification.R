#' Get classification for an AphiaID
#'
#' @export
#' @param id an AphiaID
#' @template curl
#' @examples
#' wm_classification(id = 105706)
wm_classification <- function(id, ...) {
  wm_GET(file.path(wm_base(), "AphiaClassificationByAphiaID", id), ...)
}
