#' @title redact_email
#' @description Extract UK phone numbers from a string
#'
#' @param string A character string which may contain a phone number.
#'
#' @return A tibble with 4 columns containing the original string, a logical
#' indicated whether an email address was detected, a redacted string and the redacted
#' terms.
#' @export
#'
#' @examples
#'
#' redact_email("test.email@mailserver.com")
#'
#'
redact_email <- function(string) {
  if (!is.character(string)) {
    stop("Can only work with text/string")
  }

  # Regex for target data
  regex = "([_a-z0-9-]+(\\.[_a-z0-9-]+)*@[a-z0-9-]+(\\.[a-z0-9-]+)*(\\.[a-z]{2,4}))"

  # Check if data are present (return TRUE if present, else FALSE)
  detected <- grepl(regex, string)

  # Extract data matching the regular expression for a valid email adress
  extracted <- regmatches(string, gregexpr(regex, string))

  # Redact data from string
  redacted_string <- gsub(regex, "<#redacted_email_address#>", string)

  return(
    dplyr::tibble(
      string = string,
      detected = detected,
      redacted = redacted_string,
      extracted = extracted
    )
  )

}

