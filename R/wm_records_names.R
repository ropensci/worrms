#' Get records for one or more taxonomic name(s)
#'
#' @export
#' @param name (character) start date. required.
#' @param marine_only (logical) marine only or not. default: `TRUE`
#' @template curl
#' @note there is no underscore method like other functions in this package
#' as this is the plural version for [wm_records_name()]
#' @return A list of tibble's/data.frame's, one for each of the input names
#' @examples \dontrun{
#' wm_records_names(name = 'Leucophaeus scoresbii')
#' wm_records_names(name = c('Leucophaeus scoresbii', 'Coryphaena'))
#' }
wm_records_names <- function(name, marine_only = TRUE, ...) {
  assert(name, "character")
  assert(marine_only, "logical")

  args <- cc(list(marine_only = as_log(marine_only)))
  args <- c(args,
            stats::setNames(as.list(name),
                            rep('scientificnames[]',
                                length(name))))
  result <- wm_GET(file.path(wm_base(), "AphiaRecordsByNames"),
         query = args, ...)
  if (identical(result, tibble::tibble())) {
    rep(list(tibble::data_frame()), length(name))
  } else {
    result
  }
}
