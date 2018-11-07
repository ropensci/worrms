#' Get records by vernacular name, optional fuzzy matching
#'
#' @export
#' @param name (character) a species common name. required. For
#' `wm_records_common` must be `length(name) == 1`; for `wm_records_common_`
#' can be `length(name) >= 1`
#' @param fuzzy (logical) fuzzy search. default: `FALSE`
#' @param offset (integer) record to start at. default: 1
#' @template curl
#' @template plural
#' @return A tibble/data.frame. when using underscore method, outputs from
#' each input are binded together, but can be split by `id` column
#' @examples \dontrun{
#' wm_records_common(name = 'dolphin')
#' wm_records_common(name = 'clam')
#'
#' wm_records_common_(name = c('dolphin', 'clam'))
#'
#' wm_records_common(name = 'dolphin', fuzzy = TRUE)
#' wm_records_common(name = 'clam', fuzzy = TRUE, offset = 5)
#' }
wm_records_common <- function(name, fuzzy = FALSE, offset = 1,
                            ...) {
  assert(name, "character")
  assert(fuzzy, "logical")
  assert(offset, c('numeric', 'integer'))
  assert_len(name, 1)

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
  run_bind(name, wm_records_common, fuzzy = fuzzy, offset = offset, 
    on_error = warning, ...)
}
