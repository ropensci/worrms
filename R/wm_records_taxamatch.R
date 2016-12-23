#' Get records for onen or more taxonomic name(s) using
#' the TAXAMATCH fuzzy matching algorithm
#'
#' @export
#' @param name (character) start date. required.
#' @param marine_only (logical) marine only or not. default: \code{TRUE}
#' @template curl
#' @examples
#' wm_records_taxamatch(name = 'Platanista gangetica')
#' wm_records_taxamatch(name = c('Platanista gangetica', 'Coryphaena'))
wm_records_taxamatch <- function(name, marine_only = TRUE, ...) {
  assert(name, "character")
  assert(marine_only, "logical")

  args <- cc(list(marine_only = as_log(marine_only)))
  args <- c(args,
            stats::setNames(as.list(name),
                            rep('scientificnames[]',
                                length(name))))
  wm_GET(file.path(wm_base(), "AphiaRecordsByMatchNames"),
         query = args, ...)
}
