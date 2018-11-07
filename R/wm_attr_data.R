#' Get attribute data by AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. For `wm_attr_data` it's
#' required and must be `length(id) == 1`, for `wm_attr_data_` it's
#' optional and can be `length(id) >= 1`
#' @param name (character) one or more taxonomic names. optional
#' @param include_inherited (logical) Include attributes inherited from
#' its parent taxon. Default: `FALSE`
#' @template curl
#' @template plural
#' @return A tibble/data.frame. when using underscore method, outputs from
#' each input are binded together, but can be split by `id` column
#' @examples \dontrun{
#' wm_attr_data(id = 127160)
#' wm_attr_data(id = 126436)
#'
#' wm_attr_data_(id = c(127160, 126436))
#' }
wm_attr_data <- function(id, include_inherited = FALSE, ...) {
  assert(id, c("numeric", "integer"))
  assert(include_inherited, "logical")
  assert_len(id, 1)
  wm_GET(file.path(wm_base(), "AphiaAttributesByAphiaID", id),
  	query = cc(list(include_inherited = include_inherited)), ...)
}

#' @export
#' @rdname wm_attr_data
wm_attr_data_ <- function(id = NULL, name = NULL, ...) {
  id <- id_name(id, name)
  run_bind(id, wm_attr_data, on_error = warning, ...)
}
