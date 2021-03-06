# RedactR package
This package has some helpful functions to strip potentially personal data from 
strings. These functions should minimise the risk that personal identifiable
data is collected by accident.

This is useful in situations where data has been collected with the *intention*
that no personal data should be submitted e.g. free text collected in an
anonymous survey. However, there is a chance that respondents in such a
survey may upload their name/contact details to be helpful. 

## Redaction functions
There are standalone functions to strip out emails, phone numbers and post codes
using regular expressions. There is also a named entity extraction function
which can recognise names and street addresses. They have all been combined into
the ```redact_all()``` function.

## Dependencies
If not already installed you will need to install ```dplyr```, ```spacyr```, and
```stringi``` in order to run this package. For the named entity extraction, you
will need ```Python``` installed and will need to run the ```python_setup()```
function to install the ```Python``` library ```spacy``` and the language model
on which it depends.

## Installation
The package can be installed directly from github within R via the package
```devtools```. Simply run this code in the R console:
```devtools::install_github("https://github.com/DataS-DHSC/RedactR")```

## Usage

All the redaction functions accept a string as their only argument. 

You will need to run ```python_setup()``` before named entity extraction will work.

For postcodes:

```redact_post_code("the postcode for Big Ben is SW1A 0AA.")```

For phone numbers:

```redact_phone_number("the telephone number for the house of commons is 020 7219 4272")```

For email addresses:
```redact_email("The prime ministers email address is boris.johnson.mp@parliament.uk")```

For named entities:
```redact_named_entities("The prime ministers name is Boris Johnson")```

All of the above functions return tibbles indicating whether something potentially
sensitive was detected, and presenting a redacted version of the input string with
the flagged terms extracted, which may be useful if you are looking to extract
post codes for example from data for analysis you have permission for.


To redact everything you can with these functions:
```redact_all("The prime ministers name is Boris Johnson, his emial is boris.johnson.mp@parliament.uk, he works at SW1A 0AA and the phone number there is 020 7219 4272")```


