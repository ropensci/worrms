#' Get sources for an AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. For `wm_sources` it's required
#' and must be `length(id) = 1`, for `wm_sources_` it's optional and
#' can be `length(id) >= 1`
#' @param name (character) one or more taxonomic names. optional
#' @template curl
#' @template plural
#' @return A tibble/data.frame. when using underscore method, outputs from
#' each input are binded together, but can be split by `id` column
#' @examples
#' wm_sources(id = 105706)
#' wm_sources_(id = 105706)
#' wm_sources_(id = c(105706, 126436))
#' wm_sources_(name = c("Rhincodontidae", "Gadus morhua"))
wm_sources <- function(id, ...) {
  assert(id, c("numeric", "integer"))
  wm_GET(file.path(wm_base(), "AphiaSourcesByAphiaID", id), ...)
}

#' @export
#' @rdname wm_sources
wm_sources_ <- function(id = NULL, name = NULL, ...) {
  id <- id_name(id, name)
  run_bind(id, wm_sources, ...)
}
