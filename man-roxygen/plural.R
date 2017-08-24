#' @section Singular vs. plural:
#' Of the two sister functions, the one without the underscore is the original
#' function that wraps the relavant WoRMS API method - and only accepts
#' one thing (i.e., name or AphiaID) per request.
#'
#' The sister function with the underscore at the end is the plural version,
#' accepting more than one input. Internally this function loops over
#' the non-underscore method, and labels output (whether it's a list or
#' data.frame rows) with the input names or IDs so that you can easily
#' parse output by your inputs.
