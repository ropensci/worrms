#' Get synonyms for an AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. For \code{wm_synonyms} it's required
#' and must be \code{length(id) = 1}, for \code{wm_synonyms_} it's optional and
#' can be \code{length(id) >= 1}
#' @param name (character) one or more taxonomic names. optional
#' @template curl
#' @template plural
#' @examples
#' wm_synonyms(id = 105706)
#' wm_synonyms_(id = 105706)
#' wm_synonyms_(id = c(105706, 126436))
wm_synonyms <- function(id, ...) {
  assert(id, c("numeric", "integer"))
  wm_GET(file.path(wm_base(), "AphiaSynonymsByAphiaID", id), ...)
}

#' @export
#' @rdname wm_synonyms
wm_synonyms_ <- function(id = NULL, name = NULL, ...) {
  id <- id_name(id, name)
  run_bind(id, wm_synonyms, ...)
}
