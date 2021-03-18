#' @title redact_phone_number
#' @description Extract UK phone numbers from a string
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
#' redact_phone_number("07123123123")
#' redact_phone_number("+447123123123")
#'
#'
redact_phone_number <- function(string) {
  if (!is.character(string)) {
    stop("Can only work with text/string")
  }

  # Regex for target data
  regex = "(((\\+44\\s?\\d{4}|\\(?0\\d{4}\\)?)\\s?\\d{3}\\s?\\d{3})|((\\+44\\s?\\d{3}|\\(?0\\d{3}\\)?)\\s?\\d{3}\\s?\\d{4})|((\\+44\\s?\\d{2}|\\(?0\\d{2}\\)?)\\s?\\d{4}\\s?\\d{4}))(\\s?\\#(\\d{4}|\\d{3}))?"

  # Check if data are present (return TRUE if present, else FALSE)
  detected <- grepl(regex, string)

  # Extract data matching the regular expression for a phone number
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

