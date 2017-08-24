wm_GET <- function(url, query = list(), ...) {
  cli <- crul::HttpClient$new(url = url, opts = list(...))
  temp <- cli$get(query = query)
  temp$raise_for_status()
  if (temp$status_code == 204) {
    stop(sprintf("(%s) %s", temp$status_code, temp$status_http()$message), call. = FALSE)
  }
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

ccn <- function(x) {
  Filter(function(z) !is.null(z) && NROW(z) > 0, x)
}

`%||%` <- function(x, y) if (is.null(x) || length(x) == 0) y else x

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

br <- function(x) {
  (x <- data.table::setDF(
    data.table::rbindlist(x, use.names = TRUE, fill = TRUE, idcol = "id")))
}

run_c <- function(id, fun, ...) {
  ccn(stats::setNames(lapply(id, fun, ...), id))
}

run_bind <- function(id, fun, ...) {
  tibble::as_tibble(br(ccn(
    stats::setNames(lapply(id, fun, ...), id)
  )))
}

id_name <- function(id, name) {
  if (!xor(is.null(id), is.null(name))) stop("use only one of 'id' or 'name'")
  if (!is.null(name)) {
    unlist(lapply(name, safe_wm_name2id), FALSE)
  } else {
    id
  }
}

safe_wm_name2id <- function(x, ...) {
  res <- tryCatch(wm_name2id(x, ...), error = function(e) e)
  if (inherits(res, "error")) {
    warning(sprintf("%s: %s", x, res$message))
    return(NULL)
  } else {
    return(res)
  }
}
