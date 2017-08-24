#' Get AphiaID from a taxonomic name
#'
#' @export
#' @param name (numeric/integer) a taxonomic name, required. For
#' \code{wm_name2id} must be \code{length(id) = 1}, but for \code{wm_name2id_}
#' can be \code{length(id) >= 1}
#' @template curl
#' @template plural
#' @examples
#' wm_name2id(name = "Rhincodon")
#' wm_name2id_(name = c("Rhincodon", "Gadus morhua"))
wm_name2id <- function(name, ...) {
  assert(name, "character")
  wm_GET(file.path(wm_base(), "AphiaIDByName", name), ...)
}

#' @export
#' @rdname wm_name2id
wm_name2id_ <- function(name, ...) {
  run_c(name, wm_name2id, ...)
}
