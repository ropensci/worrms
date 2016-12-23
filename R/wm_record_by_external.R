#' Get record by external ID
#'
#' @export
#' @param x id an external ID
#' @param type (character) the type of external id. one of: tsn, bold,
#' dyntaxa, eol, fishbase, iucn, lsid, ncbi, gisd. default: tsn
#' @examples
#' wm_record_by_external(id = 85257)
#' wm_record_by_external(id = 159854)
wm_record_by_external <- function(id, type = "tsn", ...) {
  wm_GET(file.path(wm_base(), "AphiaRecordByExternalID", id),
         query = cc(list(type = type)), ...)
}
