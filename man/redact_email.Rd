% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/redact_email.R
\name{redact_email}
\alias{redact_email}
\title{redact_email}
\usage{
redact_email(string)
}
\arguments{
\item{string}{A character string which may contain a phone number.}
}
\value{
A tibble with 4 columns containing the original string, a logical
indicated whether an email address was detected, a redacted string and the redacted
terms.
}
\description{
Extract UK phone numbers from a string
}
\examples{

redact_email("test.email@mailserver.com")


}
