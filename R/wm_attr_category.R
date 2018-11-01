#' Get attributes grouped by a CategoryID
#'
#' @export
#' @param id (numeric/integer) a CategoryID. For `wm_attr_category` it's
#' required and must be `length(id) = 1`, for `wm_attr_category_` it's
#' optional and can be `length(id) >= 1`
#' @param name (character) one or more taxonomic names. optional
#' @template curl
#' @template plural
#' @return A tibble/data.frame. when using underscore method, outputs from
#' each input are binded together, but can be split by `id` column
#' @examples \dontrun{
#' wm_attr_category(id = 7)
#' wm_attr_category(id = 2)
#'
#' wm_attr_category_(id = c(7, 2))
#' }
wm_attr_category <- function(id, ...) {
  assert(id, c("numeric", "integer"))
  wm_GET(file.path(wm_base(), "AphiaAttributeValuesByCategoryID", id), ...)
}

#' @export
#' @rdname wm_attr_category
wm_attr_category_ <- function(id = NULL, name = NULL, ...) {
  id <- id_name(id, name)
  run_bind(id, wm_attr_category, on_error = warning, ...)
}
