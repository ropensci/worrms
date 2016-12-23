#' Get AphiaID from a taxonomic name
#'
#' @export
#' @param name (character) a taxon name
#' @template curl
#' @examples
#' wm_name2id(name = "Rhincodon")
wm_name2id <- function(name, ...) {
  wm_GET(file.path(wm_base(), "AphiaIDByName", name), ...)
}
