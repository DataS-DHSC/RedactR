#' @title redact_post_code
#' @description  Extract UK post codes from a string.
#'
#' @param string A character string which may contain a post code.
#'
#' @return A tibble with 4 columns containing the original string, a logical
#' indicated whether a postcode was detected, a redacted string and the redacted
#' terms.
#' @export
#'
#' @examples
#'
#' redact_post_code("The postcode for Big Ben is SW1A 0AA.")
#'
redact_post_code <- function(string) {
  if (!is.character(string)) {
    stop("Can only work with text/string")
  }

  # Regex for target data
  regex = "[Gg][Ii][Rr] 0[Aa]{2})|((([A-Za-z][0-9]{1,2})|(([A-Za-z][A-Ha-hJ-Yj-y][0-9]{1,2})|(([A-Za-z][0-9][A-Za-z])|([A-Za-z][A-Ha-hJ-Yj-y][0-9]?[A-Za-z])))) {0,1}[0-9][A-Za-z]{2})"

  # Check if data are present (return TRUE if present, else FALSE)
  detected <- grepl(regex, string)

  # Extract data matching the regular expression for a valid UK postcode
  extracted <- regmatches(string, gregexpr(regex, string))

  # Redact data from string
  redacted_string <- gsub(regex, "<#redacted_post_code#>", string)


  return(
    dplyr::tibble(
      string = string,
      detected = detected,
      redacted = redacted_string,
      extracted = extracted
    )
  )

}
