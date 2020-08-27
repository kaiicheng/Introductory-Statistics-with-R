library(quantmod)

# Get data of Apple Inc.
start_date <- "2018-01-01"
getSymbols(Symbols = "AAPL", from = start_date) # create a AAPL xts object in global environment
## [1] "AAPL"

# Get data of Amazon.com
getSymbols(Symbols = "AMZN", from = start_date) # create a AMZN xts object in global environment
## [1] "AMZN"

aapl <- as.vector(coredata(AAPL$AAPL.Adjusted))
amzn <- as.vector(coredata(AMZN$AMZN.Adjusted))

aapl
amzn

# Data structures for 2 vectors
# Using matrix for 2 vectors

# Convert into matrix [,1].
matrix(aapl)

aapl_amzn <- cbind(matrix(aapl), matrix(amzn))
aapl_amzn
class(aapl_amzn)
## [1] "matrix"

dim(aapl_amzn)   # Dimension.
## [1] 664   2

# Using list for 2 vectors
aapl_amzn <- list(
  aapl,
  amzn
)
class(aapl_amzn)

aapl_amzn[[1]]

aapl_amzn[[2]]

# Using data.frame for 2 vectors.
aapl_amzn <- data.frame(
  aapl,
  amzn
)

aapl_amzn

class(aapl_amzn)
## [1] "data.frame"

dim(aapl_amzn)
## [1] 664   2


# Using cov() for covariance.

# Create a function to calculate covariance.
my_cov <- function(x, y) {
  x_bar <- mean(x)
  y_bar <- mean(y)
  n <- length(x)
  error <- (x - x_bar)*(y-y_bar)
  sum_error <- sum(error)
  covariance <- sum_error / (n-1)
  return(covariance)
}

my_cov(aapl, amzn)
## [1] 23827.4

# Check the result of cov() funciton.
cov(aapl, amzn)
## [1] 23827.4

# Using cor() for correlation.

# Create a function to calculate correlation.
my_cor <- function(x, y) {
  cov_xy <- my_cov(x, y)
  sd_x <- sd(x)
  sd_y <- sd(y)
  correlation <- cov_xy / (sd_x*sd_y)
  return(correlation)
}

my_cor(aapl, amzn)
## [1] 0.8842823

# Check the result of cor() funciton.
cor(aapl, amzn)
## [1] 0.8842823

# Summaries of 2 categorical vectors.
# Create check whether stock prices are rising or not.
price_diff_aapl <- diff(aapl)
price_diff_amzn <- diff(amzn)
is_rise_aapl <- price_diff_aapl >= 0
is_rise_amzn <- price_diff_amzn >= 0

# Using table() function to create frequency table.
table(is_rise_aapl)
table(is_rise_amzn)
table(is_rise_aapl, is_rise_amzn)

freq_table <- table(is_rise_aapl, is_rise_amzn)
freq_table
##             is_rise_amzn
## is_rise_aapl FALSE TRUE
##        FALSE   196  101
##        TRUE     93  273

# Using prop.table() function to convert frequency table to a proportional table.
prop_table <- prop.table(freq_table)
prop_table
##             is_rise_amzn
## is_rise_aapl     FALSE      TRUE
##        FALSE 0.2956259 0.1523379
##        TRUE  0.1402715 0.4117647

# Using addmargins() function for summations.
# To calculate row and column total.
addmargins(freq_table)
##             is_rise_amzn
## is_rise_aapl FALSE TRUE Sum
##        FALSE   196  101 297
##        TRUE     93  273 366
##        Sum     289  374 663

addmargins(prop_table)
##             is_rise_amzn
## is_rise_aapl     FALSE      TRUE       Sum
##        FALSE 0.2956259 0.1523379 0.4479638
##        TRUE  0.1402715 0.4117647 0.5520362
##        Sum   0.4358974 0.5641026 1.0000000





