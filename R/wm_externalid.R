#' Get an external ID via an AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. For `wm_external` it's
#' required and must be `length(id) == 1`, for `wm_external_` it's
#' optional and can be `length(id) >= 1`
#' @param type (character) the type of external id. one of: tsn, bold,
#' dyntaxa, eol, fishbase, iucn, lsid, ncbi, gisd. default: tsn
#' @param name (character) one or more taxonomic names. optional
#' @template curl
#' @template plural
#' @return An integer that is the ID. When using underscore method,
#' a list, named by the input IDs
#' @examples \dontrun{
#' # by default, get a TSN (an ITIS code)
#' wm_external(id = 1080)
#'
#' ## get many
#' wm_external_(id = c(1080, 126436))
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
#' # curl options
#' library(crul)
#' wm_external(id = 105706, verbose = TRUE)
#' }
wm_external <- function(id, type = "tsn", ...) {
  assert(id, c("numeric", "integer"))
  assert(type, "character")
  assert_len(id, 1)
  as.integer(wm_GET(
    file.path(wm_base(), "AphiaExternalIDByAphiaID", id),
    query = cc(list(type = type)), ...))
}

#' @export
#' @rdname wm_external
wm_external_ <- function(id = NULL, name = NULL, type = "tsn", ...) {
  id <- id_name(id, name)
  run_c(id, wm_external, type = type, on_error = warning, ...)
}
