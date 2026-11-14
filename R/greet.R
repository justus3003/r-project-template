#' Greet someone
#'
#' @param name Character scalar, the name to greet.
#'
#' @return A character scalar.
#' @export
#'
#' @examples
#' greet("World")
greet <- function(name) {
  checkmate::assert_string(name, min.chars = 1)
  paste0("Hello, ", name, "!")
}
