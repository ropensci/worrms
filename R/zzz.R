wm_GET <- function(url, query = list(), ...) {
  cli <- crul::HttpClient$new(url = url, opts = list(...))
  temp <- cli$get(query = query)
  if (temp$status_code > 201) {
    stop(sprintf("(%s) - %s", temp$status_code, temp$status_http()$message),
         call. = FALSE)
  }
  temp$raise_for_status()
  tmp <- jsonlite::fromJSON(temp$parse(), flatten = TRUE)
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

assert <- function(x, class) {
  if (!inherits(x, class)) {
    stop(deparse(substitute(x)), " must be of class ", class, call. = FALSE)
  }
}

foo <- function(x) {
  deparse(substitute(x))
}
