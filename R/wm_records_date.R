#' Get records by date
#'
#' @export
#' @param start_date (character) start date. required.
#' @param end_date (character) end date. optional
#' @param marine_only (logical) marine only or not. default: \code{TRUE}
#' @param offset (integer) record to start at. default: 1
#' @template curl
#' @examples
#' a_date <- format(Sys.Date() - 1, "%Y-%m-%dT%H:%M:%S+00:00")
#' wm_records_date(a_date)
wm_records_date <- function(start_date, end_date = NULL, marine_only = TRUE,
                            offset = 1, ...) {
  assert(start_date, c("character", "Date"))
  assert(end_date, c("character", "Date"))
  assert(marine_only, "logical")
  assert(offset, c('numeric', 'integer'))

  wm_GET(file.path(wm_base(), "AphiaRecordsByDate"),
         query = cc(list(
           startdate = start_date, enddate = end_date,
           marine_only = as_log(marine_only), offset = offset)), ...)
}
