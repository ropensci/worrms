#' Get distribution data by AphiaID
#'
#' @export
#' @param id an AphiaID. required.
#' @template curl
#' @examples
#' wm_distribution(id = 156806)
wm_distribution <- function(id, ...) {
  assert(id, c("numeric", "integer"))
  wm_GET(file.path(wm_base(), "AphiaDistributionsByAphiaID", id), ...)
}
