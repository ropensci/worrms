#' Get records by single name, optional fuzzy matching
#'
#' @export
#' @param name (character) a taxonomic name, required.
#' @param fuzzy (logical) fuzzy search. default: `TRUE`
#' @param marine_only (logical) marine only or not. default: `TRUE`
#' @param offset (integer) record to start at. default: 1
#' @template curl
#' @note there is no underscore method like other functions in this package
#' as there is already a plural version: [wm_records_names()]
#' @return A tibble/data.frame
#' @examples \dontrun{
#' wm_records_name(name = 'Leucophaeus')
#' wm_records_name(name = 'Leucophaeus', fuzzy = FALSE)
#' wm_records_name(name = 'Leucophaeus', marine_only = FALSE)
#' wm_records_name(name = 'Platanista', marine_only = FALSE)
#' wm_records_name(name = 'Platanista', marine_only = FALSE, offset = 5)
#' }
wm_records_name <- function(name, fuzzy = TRUE, marine_only = TRUE, offset = 1,
                            ...) {
  assert(name, "character")
  assert(fuzzy, "logical")
  assert(marine_only, "logical")
  assert(offset, c('numeric', 'integer'))

  if (length(name) > 1) stop("'name' must be of length 1", call. = FALSE)
  args <- cc(list(
    like = as_log(fuzzy),
    marine_only = as_log(marine_only),
    offset = offset
  ))
  wm_GET(file.path(wm_base(), "AphiaRecordsByName", name),
         query = args, ...)
}
