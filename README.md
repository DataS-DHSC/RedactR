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
