#' @title python_setup
#' @description This function checks installs the python library spacy and the
#' English language model on which named entity extraction relies. You must have
#' python installed already for this to work.
#'
#' @importFrom spacyr spacy_initialize
#' @export
#'
python_setup <- function() {
  system("pip install spacy")#install spacy
  system("python -m spacy download en_core_web_sm")
  spacyr::spacy_initialize(model = "en_core_web_sm")
}

