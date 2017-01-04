wm_GET <- function(url, query = list(), ...) {
  cli <- crul::HttpClient$new(url = url, opts = list(...))
  temp <- cli$get(query = query)
  temp$raise_for_status()
  tmp <- jsonlite::fromJSON(temp$parse("UTF-8"), flatten = TRUE)
  if (inherits(tmp, "data.frame")) {
    tibble::as_data_frame(tmp)
  } else if (inherits(tmp, "list")) {
    if (all(sapply(tmp, class) == "data.frame")) {
      lapply(tmp, tibble::as_data_frame)
    } else {
      tmp
    }
  } else {
    tmp
  }
}

wm_base <- function() "http://www.marinespecies.org/rest"

cc <- function(x) Filter(Negate(is.null), x)

as_log <- function(x) {
  if (is.null(x)) {
    x
  } else {
    if (x) "true" else "false"
  }
}

assert <- function(x, y) {
  if (!is.null(x)) {
    if (!class(x) %in% y) {
      stop(deparse(substitute(x)), " must be of class ",
           paste0(y, collapse = ", "), call. = FALSE)
    }
  }
}
