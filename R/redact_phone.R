
#' Extract UK phone numbers from a string
#'
#' @param string A character string which may contain a phone number.
#'
#' @return A tibble with 4 columns containing the original string, a logical
#' indicated whether a phone number was detected, a redacted string and the redacted
#' terms.
#' @export
#'
#' @examples
#'
#' phone_number_code_from_string("07123123123")
#' phone_number_code_from_string("+447123123123")
#'
#'
phone_number_code_from_string <- function(string) {
  if (!is.character(string)) {
    stop("Can only work with text/string")
  }

  # Regex for target data
  regex = "((\\+44(\\s\\(0\\)\\s|\\s0\\s|\\s)?)|0)7\\d{3}(\\s)?\\d{6}"

  # Check if data are present (return TRUE if present, else FALSE)
  detected <- grepl(regex, string)

  # Extract data matching the regular expression for a valid UK postcode
  extracted <- regmatches(string, gregexpr(regex, string))

  # Redact data from string
  redacted_string <- gsub(regex, "<#redacted_phone_number#>", string)

  return(
    dplyr::tibble(
      string = string,
      detected = detected,
      redacted = redacted_string,
      extracted = extracted
    )
  )

}

