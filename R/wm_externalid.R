#' Get an external ID via an AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. required.
#' @param type (character) the type of external id. one of: tsn, bold,
#' dyntaxa, eol, fishbase, iucn, lsid, ncbi, gisd. default: tsn
#' @template curl
#' @examples
#' # by default, get a TSN (an ITIS code)
#' wm_external(id = 1080)
#'
#' # BOLD code
#' wm_external(id = 278468, type = "bold")
#'
#' # NCBI code
#' wm_external(id = 278468, type = "ncbi")
#'
#' # fishbase code
#' wm_external(id = 278468, type = "fishbase")
#'
#' library(crul)
#' wm_external(id = 105706, verbose = TRUE)
wm_external <- function(id, type = "tsn", ...) {
  assert(id, c("numeric", "integer"))
  assert(type, "character")
  as.integer(wm_GET(
    file.path(wm_base(), "AphiaExternalIDByAphiaID", id),
    query = cc(list(type = type)), ...))
}
