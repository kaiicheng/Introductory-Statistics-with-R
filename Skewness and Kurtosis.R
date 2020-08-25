# Load data.
library(quantmod)

start_date <- "2018-01-01"
getSymbols(Symbols = "AAPL", from = start_date) # create a AAPL xts object in global environment
head(AAPL)
tail(AAPL)

aapl <- as.vector(coredata(AAPL$AAPL.Adjusted)) # extract adjusted price as a vector
class(aapl)

length(aapl)

# Measures of shape

# Skewness

scale(aapl)   # Result is a matrix of [,1].
scale(aapl)[,1]   # Prefer vector.

skewness <- function(x) {
  n <- length(x)
  z_scores <- scale(x)[,1]
  return(sum(z_scores^3) / n)
}
skewness(aapl)

# Kurtosis

kurtosis <- function(x) {
  n <- length(x)
  z_scores <- scale(x)[,1]
  return(sum(z_scores^4) / n - 3)
}
kurtosis(aapl)



# Summaries of a categorical vector

# Converting numeric vector to categorical
price_diff <- diff(aapl)
is_rise <- price_diff >= 0
length(is_rise)
table(is_rise)

# Using table() function to tabulate data
table(is_rise)

# Proportion table.
prop.table(table(is_rise))


























