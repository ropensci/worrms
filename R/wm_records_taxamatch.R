#' Get records for one or more taxonomic name(s) using
#' the TAXAMATCH fuzzy matching algorithm
#'
#' @export
#' @param name (character) taxon name. required.
#' @param marine_only (logical) marine only or not. default: `TRUE`
#' @template curl
#' @note there is no underscore method like other functions in this package
#' as this function already accepts many names
#' @return A list of tibble's/data.frame's, one for each of the input names
#' @examples \dontrun{
#' wm_records_taxamatch(name = 'Leucophaeus')
#' wm_records_taxamatch(name = c('Leucophaeus', 'Coryphaena'))
#' }
wm_records_taxamatch <- function(name, marine_only = TRUE, ...) {
  assert(name, "character")
  assert(marine_only, "logical")

  args <- cc(list(marine_only = as_log(marine_only)))
  args <- c(args,
            stats::setNames(as.list(name),
                            rep('scientificnames[]',
                                length(name))))
  result <- wm_GET(file.path(wm_base(), "AphiaRecordsByMatchNames"),
         query = args, ...)
  if (identical(result, tibble::tibble())) {
    rep(list(tibble::data_frame()), length(name))
  } else {
    result
  }
}
