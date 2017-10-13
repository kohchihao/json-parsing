library(httr)
library(jsonlite)

symbol <- "MYR"
base <- "SGD"
url <- paste0("http://api.fixer.io/latest?symbols=", symbol, "&base=", base)

jsonResponse <- content(GET(url))

print(paste0(base, 1, " = ", symbol, round(jsonResponse$rates$MYR, 1)))
