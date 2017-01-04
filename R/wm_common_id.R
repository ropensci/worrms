#' Get vernacular names from an AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. required.
#' @template curl
#' @examples
#' wm_common_id(id = 105706)
#' wm_common_id(id = 156806)
#' wm_common_id(id = 397065)
wm_common_id <- function(id, ...) {
  assert(id, c("numeric", "integer"))
  if (length(id) > 1) stop("'id' must be of length 1", call. = FALSE)
  wm_GET(file.path(wm_base(), "AphiaVernacularsByAphiaID", id), ...)
}
