wm_GET <- function(url, query = list(), ...) {
  cli <- crul::HttpClient$new(url = url, opts = list(...))
  temp <- cli$get(query = query)
  if (temp$status_code > 201) {
    stop(sprintf("(%s) - %s", temp$status_code, temp$status_http()$message),
         call. = FALSE)
  }
  temp$raise_for_status()
  jsonlite::fromJSON(temp$parse(), flatten = TRUE)
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
