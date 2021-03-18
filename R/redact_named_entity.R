#' @title python_setup
#' @description This function checks installs the python library spacy and the
#' English language model on which named entity extraction relies. You must have
#' python installed already for this to work.
#'
#' @export
#'
python_setup <- function() {
  system("pip install spacy")#install spacy
  system("python -m spacy download en_core_web_sm")
  spacyr::spacy_initialize(model = "en_core_web_sm")
}





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
#'
redact_named_entities <- function(string) {

  if (!is.character(string)) {
    stop("Can only work with text/string")
  }

  extracted <- spacyr::spacy_extract_entity(string, type = "named")

  out <- tibble(
    text = string,
    detected = FALSE,
    redacted = NA,
    extracted = list(NA)
  )

  if (length(extracted) > 0) {
    pattern = extracted$text

    replacement = paste0("<#redacted_", extracted$ent_type, "#>")

    redacted = stringi::stri_replace_all_fixed(string, pattern, replacement, vectorize_all = F)

    out <- tibble(
      string = string,
      detected = TRUE,
      redacted = redacted,
      extracted = list(extracted)
    )

  }
  return(out)

}



