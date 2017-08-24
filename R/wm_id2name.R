#' Get taxonomic name for an AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID, required. For `wm_id2name`
#' must be `length(id) = 1`, but for `wm_id2name_` can be
#' `length(id) >= 1`
#' @template curl
#' @template plural
#' @return An character string that is the taxnomic name. When using underscore
#' method, a list, named by the input IDs
#' @examples \dontrun{
#' wm_id2name(id = 105706)
#' wm_id2name_(id = c(105706, 126436))
#' }
wm_id2name <- function(id, ...) {
  assert(id, c("numeric", "integer"))
  wm_GET(file.path(wm_base(), "AphiaNameByAphiaID", id), ...)
}

#' @export
#' @rdname wm_id2name
wm_id2name_ <- function(id, ...) {
  id <- id_name(id, NULL)
  run_c(id, wm_id2name, ...)
}
