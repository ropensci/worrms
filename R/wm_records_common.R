#' Get records by vernacular name, optional fuzzy matching
#'
#' @export
#' @param name (character) a species common name. required.
#' @param fuzzy (logical) fuzzy search. default: \code{FALSE}
#' @param offset (integer) record to start at. default: 1
#' @examples
#' wm_records_common(name = 'dolphin')
#' wm_records_common(name = 'clam')
#' wm_records_common(name = 'dolphin', fuzzy = TRUE)
#' wm_records_common(name = 'clam', fuzzy = TRUE, offset = 5)
wm_records_common <- function(name, fuzzy = FALSE, offset = 1,
                            ...) {
  if (length(name) > 1) stop("'name' must be of length 1", call. = FALSE)
  args <- cc(list(
    like = as_log(fuzzy),
    offset = offset
  ))
  wm_GET(file.path(wm_base(), "AphiaRecordsByVernacular", name),
         query = args, ...)
}
