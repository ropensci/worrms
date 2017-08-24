#' Get classification for an AphiaID
#'
#' @export
#' @param id (numeric/integer) an AphiaID. For `wm_children` it's
#' required and must be `length(id) = 1`, for `wm_children_` it's
#' optional and can be `length(id) >= 1`
#' @param name (character) one or more taxonomic names. optional
#' @template curl
#' @template plural
#' @return A tibble/data.frame. when using underscore method, outputs from
#' each input are binded together, but can be split by `id` column
#' @examples
#' wm_classification(id = 105706)
#' wm_classification(id = 126436)
#'
#' wm_classification(254967)
#' wm_classification(344089)
#'
#' # plural version, via id or name
#' wm_classification_(id = c(254967, 344089))
#' wm_classification_(name = c('Platanista gangetica', 'Leucophaeus scoresbii'))
wm_classification <- function(id, ...) {
  assert(id, c("numeric", "integer"))
  res <- wm_GET(file.path(wm_base(), "AphiaClassificationByAphiaID", id), ...)
  done <- FALSE
  out <- list()
  it <- 0
  while (!done) {
    it <- it + 1
    ch <- res$child
    if (!is.null(ch)) {
      out[[it]] <- ch[!names(ch) %in% "child"]
      res <- list(child = ch$child)
    } else {
      done <- TRUE
    }
  }
  dat <- Filter(function(x) !is.null(x) && length(x) != 0, out)
  dat <- do.call("rbind.data.frame", dat)
  dat$rank <- as.character(dat$rank)
  dat$scientificname <- as.character(dat$scientificname)
  if (NROW(dat) == 0) dat <- NULL
  tibble::as_tibble(dat)
}

#' @export
#' @rdname wm_classification
wm_classification_ <- function(id = NULL, name = NULL, ...) {
  id <- id_name(id, name)
  run_bind(id, wm_classification, ...)
}
