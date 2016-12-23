#' Get classification for an AphiaID
#'
#' @export
#' @param id an AphiaID
#' @examples
#' wm_classification(id = 105706)
wm_classification <- function(id, marine_only = TRUE, offset = 1, ...) {
  wm_GET(file.path(wm_base(), "AphiaClassificationByAphiaID", id), ...)
}
