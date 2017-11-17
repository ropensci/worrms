#' Get attribute definition by ID
#'
#' @export
#' @param id (numeric/integer) an attribute ID. For `wm_attr_def` it's
#' required and must be `length(id) = 1`, for `wm_attr_def_` it's
#' optional and can be `length(id) >= 1`
#' @param include_inherited (logical) Include attributes inherited from
#' its parent taxon. Default: `FALSE`
#' @template curl
#' @template plural
#' @return A tibble/data.frame. when using underscore method, outputs from
#' each input are binded together, but can be split by `id` column
#' @examples \dontrun{
#' wm_attr_def(id = 1)
#' wm_attr_def(id = 4)
#' wm_attr_def(id = 4, include_inherited = TRUE)
#'
#' wm_attr_def_(id = c(4, 1))
#' }
wm_attr_def <- function(id, include_inherited = FALSE, ...) {
  assert(id, c("numeric", "integer"))
  assert(include_inherited, "logical")
  wm_GET(file.path(wm_base(), "AphiaAttributeKeysByID", id),
  	query = cc(list(include_inherited = include_inherited)), ...)
}

#' @export
#' @rdname wm_attr_def
wm_attr_def_ <- function(id = NULL, name = NULL, ...) {
  id <- id_name(id, name)
  run_bind(id, wm_attr_def, ...)
}
