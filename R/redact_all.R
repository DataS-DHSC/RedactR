#' @title redact_all
#' @description This function takes a string and redacts all the phone numbers,
#' email addresses, post codes, and other named entities that it can in an effort
#' to exclude accidentally collected personal data from subsequent analysis.
#'
#' @param string A character string which may contain personal data.
#'
#' @return A string with potential personal data redacted.
#' @export
#'
redact_all<-function(string){

  if (!is.character(string)) {
    stop("Can only work with text/string")
  }

email_free <- redact_email(string)

phone_free <- redact_phone_number(email_free$redacted)

name_free <- redact_named_entities(phone_free$redacted)

pcd_free <- redact_post_code(name_free$redacted)

return(pcd_free$redacted)

}


