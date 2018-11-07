#' Get AphiaID from a taxonomic name
#'
#' @export
#' @param name (character) a taxonomic name, required. For
#' `wm_name2id` must be `length(name) == 1`, but for `wm_name2id_`
#' can be `length(name) >= 1`
#' @template curl
#' @template plural
#' @return An integer that is the AphiaID. When using underscore method,
#' a list, named by the input names
#' @examples \dontrun{
#' wm_name2id(name = "Rhincodon")
#' wm_name2id_(name = c("Rhincodon", "Gadus morhua"))
#' }
wm_name2id <- function(name, ...) {
  assert(name, "character")
  assert_len(name, 1)
  wm_GET(file.path(wm_base(), "AphiaIDByName", name), ...)
}

#' @export
#' @rdname wm_name2id
wm_name2id_ <- function(name, ...) {
  run_c(name, wm_name2id, on_error = warning, ...)
}
