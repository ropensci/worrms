#' Get AphiaIDs by attribute definition ID
#'
#' @export
#' @param id (numeric/integer) a attribute ID. For `wm_attr_aphia` it's
#' required and must be `length(id) == 1`, for `wm_attr_aphia_` it's
#' optional and can be `length(id) >= 1`
#' @param offset (integer) record to start at. default: 1
#' @param name (character) one or more taxonomic names. optional
#' @template curl
#' @template plural
#' @return A tibble/data.frame. when using underscore method, outputs from
#' each input are binded together, but can be split by `id` column
#' @examples \dontrun{
#' wm_attr_aphia(id = 7)
#' wm_attr_aphia(id = 4)
#' wm_attr_aphia(id = 4, offset = 50)
#'
#' wm_attr_aphia_(id = c(7, 2))
#' }
wm_attr_aphia <- function(id, offset = 1, ...) {
  assert(id, c("numeric", "integer"))
  assert(offset, c("numeric", "integer"))
  assert_len(id, 1)
  wm_GET(file.path(wm_base(), "AphiaIDsByAttributeKeyID", id),
  	query = cc(list(offset = offset)), ...)
}

#' @export
#' @rdname wm_attr_aphia
wm_attr_aphia_ <- function(id = NULL, name = NULL, ...) {
  id <- id_name(id, name)
  run_bind(id, wm_attr_aphia, on_error = warning, ...)
}
