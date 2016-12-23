#' Get records by date
#'
#' @export
#' @param start_date (character) start date. required.
#' @param end_date (character) end date. optional
#' @param marine_only (logical) marine only or not. default: \code{TRUE}
#' @param offset (integer) record to start at. default: 1
#' @template curl
#' @examples
#' wm_records_date('2016-12-23T05:59:45+00:00')
wm_records_date <- function(start_date, end_date = NULL, marine_only = TRUE,
                            offset = 1, ...) {

  wm_GET(file.path(wm_base(), "AphiaRecordsByDate"),
         query = cc(list(
           startdate = start_date, enddate = end_date,
           marine_only = as_log(marine_only), offset = offset)), ...)
}
