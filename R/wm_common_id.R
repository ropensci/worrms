#' Get vernacular names from an AphiaID
#'
#' @export
#' @param id an AphiaID
#' @examples
#' wm_common_id(id = 105706)
#' wm_common_id(id = 156806)
#' wm_common_id(id = 397065)
wm_common_id <- function(id, ...) {
  if (length(id) > 1) stop("'id' must be of length 1", call. = FALSE)
  wm_GET(file.path(wm_base(), "AphiaVernacularsByAphiaID", id), ...)
}
