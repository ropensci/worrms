#' Get records by vernacular name, optional fuzzy matching
#'
#' @export
#' @param name (character) a species common name. required. For
#' \code{wm_records_common} must be \code{length(id) = 1}; for
#' \code{wm_records_common_} can be \code{length(id) >= 1}
#' @param fuzzy (logical) fuzzy search. default: \code{FALSE}
#' @param offset (integer) record to start at. default: 1
#' @template curl
#' @template plural
#' @examples
#' wm_records_common(name = 'dolphin')
#' wm_records_common(name = 'clam')
#'
#' wm_records_common_(name = c('dolphin', 'clam'))
#'
#' \dontrun{
#' wm_records_common(name = 'dolphin', fuzzy = TRUE)
#' wm_records_common(name = 'clam', fuzzy = TRUE, offset = 5)
#' }
wm_records_common <- function(name, fuzzy = FALSE, offset = 1,
                            ...) {
  assert(name, "character")
  assert(fuzzy, "logical")
  assert(offset, c('numeric', 'integer'))

  if (length(name) > 1) stop("'name' must be of length 1", call. = FALSE)
  args <- cc(list(
    like = as_log(fuzzy),
    offset = offset
  ))
  wm_GET(file.path(wm_base(), "AphiaRecordsByVernacular", name),
         query = args, ...)
}

#' @export
#' @rdname wm_records_common
wm_records_common_ <- function(name, fuzzy = FALSE, offset = 1, ...) {
  run_bind(name, wm_records_common, fuzzy = fuzzy, offset = offset, ...)
}
