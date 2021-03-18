#' @title redact_named_entities
#'
#' @description Relies on python_setup having run successfully.
#' Redact named entities e.g. people, addresses, from a string.
#'
#' @param string A character string which may contain a named entity.
#'
#' @return A tibble with 4 columns containing the original string, a logical
#' indicated whether a named entity was detected, a redacted string and the redacted
#' terms.
#' @export
#' @importFrom dplyr tibble
#' @importFrom spacyr spacy_extract_entity
#' @importFrom stringi stri_replace_all_fixed
#'
redact_named_entities <- function(string) {

  if (!is.character(string)) {
    stop("Can only work with text/string")
  }

  extracted <- spacyr::spacy_extract_entity(string, type = "named")

  out <- dplyr::tibble(
    text = string,
    detected = FALSE,
    redacted = NA,
    extracted = list(NA)
  )

  if (length(extracted) > 0) {
    pattern = extracted$text

    replacement = paste0("<#redacted_", extracted$ent_type, "#>")

    redacted = stringi::stri_replace_all_fixed(string, pattern, replacement, vectorize_all = F)

    out <- dplyr::tibble(
      string = string,
      detected = TRUE,
      redacted = redacted,
      extracted = list(extracted)
    )

  }
  return(out)

}



