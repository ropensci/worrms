#' Get distribution data by AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. For \code{wm_distribution} it's
#' required and must be \code{length(id) = 1}, for \code{wm_distribution_} it's
#' optional and can be \code{length(id) >= 1}
#' @param name (character) one or more taxonomic names. optional
#' @template curl
#' @template plural
#' @examples
#' wm_distribution(id = 156806)
#' wm_distribution(id = 126436)
#'
#' wm_distribution_(id = c(156806, 126436))
wm_distribution <- function(id, ...) {
  assert(id, c("numeric", "integer"))
  wm_GET(file.path(wm_base(), "AphiaDistributionsByAphiaID", id), ...)
}

#' @export
#' @rdname wm_distribution
wm_distribution_ <- function(id = NULL, name = NULL, ...) {
  id <- id_name(id, name)
  run_bind(id, wm_distribution, ...)
}
