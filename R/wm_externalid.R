#' Get AphiaID via an external ID
#'
#' @export
#' @param x id an external ID
#' @param type (character) the type of external id. one of: tsn, bold,
#' dyntaxa, eol, fishbase, iucn, lsid, ncbi, gisd. default: tsn
#' @examples
#' wm_external(id = 1080)
#' wm_external(id = 105706)
#'
#' library(crul)
#' wm_external(id = 105706, verbose = TRUE)
wm_external <- function(id, type = "tsn", ...) {
  wm_GET(
    file.path(wm_base(), "AphiaExternalIDByAphiaID", id),
    query = cc(list(type = type)), ...)
}
