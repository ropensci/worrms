#' World Register of Marine Species Client
#'
#' @name worrms-package
#' @aliases worrms
#' @docType package
#' @keywords package
#' @author Scott Chamberlain \email{myrmecocystus@@gmail.com}
#'
#' @section Fail behavior:
#' The WoRMS REST API doesn't have sophisticated error messaging, so
#' most errors will result in a \code{(204) - No Content} or
#' in \code{(400) - Bad Request}
#'
#' Because WoRMS doesn't do comprehensive error reporting, we do a fair
#' amount of checking user inputs to help prevent errors that will be
#' meaningless to the user. Let us know if we can improve on this.
NULL
