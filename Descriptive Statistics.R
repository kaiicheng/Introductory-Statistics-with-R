# Load data.
library(quantmod)

start_date <- "2018-01-01"
getSymbols(Symbols = "AAPL", from = start_date) # create a AAPL xts object in global environment
head(AAPL)
tail(AAPL)

aapl <- as.vector(coredata(AAPL$AAPL.Adjusted)) # extract adjusted price as a vector
class(aapl)

length(aapl)

# mean() function
# Create a function to calculate mean.
my_mean <- function(x) {
  n <- length(x)
  summation <- sum(x)
  return(summation / n)
}
my_mean(aapl)

# Check the result of mean() function
mean(aapl)

# median() function

my_median <- function(x) {
  n <- length(x)
  sorted_x <- sort(x)
  middle_index <- n %/% 2 + 1 # floor divide
  if (n %% 2 == 1) { # modulo
    return(sorted_x[middle_index])
  } else {
    middle_indices <- c(middle_index - 1, middle_index)
    middle_values <- sorted_x[middle_indices]
    return(sum(middle_values) / 2)
  }
}

my_median(aapl)
median(aapl)

# quantile() function
quantile(aapl)
quantile(aapl)["25%"]
quantile(aapl)['50%']

# max() and min()

help(range)

max(aapl)

min(aapl)

max(aapl) - min(aapl)

# range()
range(aapl)
diff(range(aapl))

# IQR()
aapl_quantile <- quantile(aapl)

aapl_quantile["75%"]

aapl_quantile["25%"]

unname(aapl_quantile["75%"] - aapl_quantile["25%"])

IQR(aapl)

# Finding outlier.
lower_threshold <- unname(aapl_quantile["25%"]) - 1.5 * IQR(aapl)
upper_threshold <- unname(aapl_quantile["75%"]) + 1.5 * IQR(aapl)
lower_threshold
upper_threshold
aapl < lower_threshold
aapl > upper_threshold


is_outlier <- aapl < lower_threshold | aapl > upper_threshold
#"|" => union
aapl[is_outlier]   # Outliers. 

trading_dates <- index(AAPL)

trading_dates[is_outlier]

# var() function

# Create a variable function.
my_var <- function(x) {
  n <- length(x)
  x_bar <- mean(x)
  squared_error <- (x - x_bar)**2
  sum_squared_error <- sum(squared_error)
  variance <- sum_squared_error / (n - 1)
  return(variance)
}

my_var(aapl)

# Check the result of var() function.
var(aapl)

# sd()function

# Create a SD function.
my_sd <- function(x) {
  return(sqrt(my_var(x)))
}

my_sd(aapl)

# Check the result of sd() function.
sd(aapl)

# scale() function
# z-scores = (x - x(mean))/s 
# => how many SD distance from mean.

# Create a scale function.
my_scale <- function(x) {
  x_bar <- mean(x)
  s <- sd(x)
  z_scores <- (x - x_bar) / s
  return(z_scores)
}

length(aapl)
length(my_scale(aapl))

my_scale(aapl)

my_scale(aapl)[1:5]

# Check the result of scale() function.
scale(aapl)[1:5]
