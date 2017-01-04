#' Get AphiaID via an external ID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. required.
#' @param type (character) the type of external id. one of: tsn, bold,
#' dyntaxa, eol, fishbase, iucn, lsid, ncbi, gisd. default: tsn
#' @template curl
#' @examples
#' wm_external(id = 1080)
#' wm_external(id = 105706)
#'
#' library(crul)
#' wm_external(id = 105706, verbose = TRUE)
wm_external <- function(id, type = "tsn", ...) {
  assert(id, c("numeric", "integer"))
  assert(type, "character")
  wm_GET(
    file.path(wm_base(), "AphiaExternalIDByAphiaID", id),
    query = cc(list(type = type)), ...)
}
