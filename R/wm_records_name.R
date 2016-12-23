#' Get records by single name, optional fuzzy matching
#'
#' @export
#' @param name (character) start date. required.
#' @param fuzzy (logical) fuzzy search. default: \code{TRUE}
#' @param marine_only (logical) marine only or not. default: \code{TRUE}
#' @param offset (integer) record to start at. default: 1
#' @template curl
#' @examples
#' wm_records_name(name = 'Platanista gangetica')
#' wm_records_name(name = 'Platanista gangetica', fuzzy = FALSE)
#' wm_records_name(name = 'Platanista gangetica', marine_only = FALSE)
#' wm_records_name(name = 'Platanista', marine_only = FALSE)
#' wm_records_name(name = 'Platanista', marine_only = FALSE, offset = 5)
wm_records_name <- function(name, fuzzy = TRUE, marine_only = TRUE, offset = 1,
                            ...) {
  if (length(name) > 1) stop("'name' must be of length 1", call. = FALSE)
  args <- cc(list(
    like = as_log(fuzzy),
    marine_only = as_log(marine_only),
    offset = offset
  ))
  wm_GET(file.path(wm_base(), "AphiaRecordsByName", name),
         query = args, ...)
}
