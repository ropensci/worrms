#' Get synonyms for an AphiaID
#'
#' @export
#' @param id an AphiaID
#' @template curl
#' @examples
#' wm_synonyms(id = 105706)
wm_synonyms <- function(id, ...) {
  wm_GET(file.path(wm_base(), "AphiaSynonymsByAphiaID", id), ...)
}
