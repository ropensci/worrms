#' Get taxonomic name for an AphiaID
#'
#' @export
#' @param id an AphiaID
#' @examples
#' wm_id2name(id = 105706)
wm_id2name <- function(id, ...) {
  wm_GET(file.path(wm_base(), "AphiaNameByAphiaID", id), ...)
}
