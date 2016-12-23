#' Get children for an AphiaID
#'
#' @export
#' @param id an AphiaID
#' @param marine_only (logical) marine only or not. default: \code{TRUE}
#' @param offset (integer) record to start at. default: 1
#' @examples
#' wm_children(id = 105706)
#' wm_children(id = 105706, FALSE)
#' wm_children(id = 105706, offset = 5)
wm_children <- function(id, marine_only = TRUE, offset = 1, ...) {
  wm_GET(file.path(wm_base(), "AphiaChildrenByAphiaID", id),
         query = cc(list(marine_only = as_log(marine_only),
                         offset = offset)), ...)
}
