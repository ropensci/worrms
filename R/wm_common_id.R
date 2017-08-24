#' Get vernacular names from an AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. For \code{wm_common_id} it's
#' required and must be \code{length(id) = 1}, for \code{wm_common_id_} it's
#' optional and can be \code{length(id) >= 1}
#' @param name (character) one or more taxonomic names. optional
#' @template curl
#' @template plural
#' @examples
#' wm_common_id(id = 105706)
#' wm_common_id(id = 156806)
#' wm_common_id(id = 397065)
#'
#' wm_common_id_(id = c(105706, 156806, 397065))
#' nms <- c("Rhincodontidae", "Mesodesma deauratum", "Cryptomya californica")
#' wm_common_id_(name = nms)
wm_common_id <- function(id, ...) {
  assert(id, c("numeric", "integer"))
  if (length(id) > 1) stop("'id' must be of length 1", call. = FALSE)
  wm_GET(file.path(wm_base(), "AphiaVernacularsByAphiaID", id), ...)
}

#' @export
#' @rdname wm_common_id
wm_common_id_ <- function(id = NULL, name = NULL, ...) {
  id <- id_name(id, name)
  run_bind(id, wm_common_id, ...)
}
