#' Get distribution data by AphiaID
#'
#' @export
#' @param x xxx
#' @template curl
#' @examples
#' wm_distribution(id = 1080)
wm_distribution <- function(id, ...) {
  stop("not working for some reason", call. = FALSE)
  wm_GET(file.path(wm_base(), "AphiaDistributionsByAphiaID", id), ...)
}
