library(ggplot2)
library(quantmod)


# Exploring univariate data.

# Download Data.
start_date <- "2018-01-01"
getSymbols(Symbols = "VTI", from = start_date) # create a VTI xts object in global environment
## [1] "VTI"
vti <- as.vector(coredata(VTI$VTI.Adjusted)) # extract adjusted prices as a vector
class(vti)
## [1] "numeric"

# Getting real-world data: AAPL
getSymbols(Symbols = "AAPL", from = start_date) # create a AAPL xts object in global environment
## [1] "AAPL"

aapl <- as.vector(coredata(AAPL$AAPL.Adjusted)) # extract adjusted prices as a vector
class(aapl)
## [1] "numeric"

# Getting real-world data: AMZN
start_date <- "2018-01-01"
getSymbols(Symbols = "AMZN", from = start_date) # create a AMZN xts object in global environment
## [1] "AMZN"
amzn <- as.vector(coredata(AMZN$AMZN.Adjusted))

# Using hist() to explore the shape of numeric univariate data
hist(vti, breaks = 30)

hist(aapl, breaks = 30)

# Download dplyr package to filter data
library(dplyr)

hist(vti, breaks = 30)

hist(aapl, breaks = 30)


# Multivariate data
# Covid 19 daily report

read_daily_report <- function(file_date) {
  file_date_str <- format(file_date, "%m-%d-%Y")
  file_url <- sprintf("https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_daily_reports/%s.csv", file_date_str)
  daily_report <- read.csv(file_url, stringsAsFactors = FALSE)
  return(daily_report)
}

# Get data 2 days ago.
sys_date <- Sys.Date() - 2
daily_report <- read_daily_report(sys_date)

dim(daily_report)

str(daily_report)

# Combine different states, counties ad provinces of same country.
confirmed_by_country <- daily_report %>% 
  group_by(Country_Region) %>% 
  summarise(confirmed = sum(Confirmed)) %>% 
  as.data.frame()

hist(confirmed_by_country$confirmed, breaks = 30)

hist(confirmed_by_country$confirmed, breaks = 10)

# Using density plot to explore the shape of numeric univariate data
plot(density(vti))

plot(density(aapl))

plot(density(confirmed_by_country$confirmed))

# Two plots will overlap if probability = FALSE
hist(vti, breaks = 30)
lines(density(vti))

# Combining histogram and density plot to explore the shape of numeric univariate data
dens <- density(vti)
# Y-axis is probability and two plots are easily combined.
hist(vti, probability = TRUE, breaks = 30)
lines(dens)


# Using quantile plot to explore the shape of numeric univariate data
qqnorm(vti)
# Normal distribution.

qqnorm(aapl)

qqnorm(confirmed_by_country$confirmed)

# Using box plot to explore the shape of numeric univariate data
boxplot(vti)

boxplot(aapl)


# Using bar plot to explore tabulating of categorical univariate data
diff_vti <- diff(vti)
is_rise <- diff_vti > 0

table(is_rise_aapl)
## is_rise
## FALSE  TRUE 
##   285   379

barplot(table(is_rise), main = "VTI")

barplot(table(is_rise), horiz = TRUE, main = "VTI")

# Check head and tail of confirmed cases.
head(confirmed_by_country)
tail(confirmed_by_country)

daily_report[["Country_Region"]] == "US"

# Wrong
dim(daily_report[daily_report[["Country_Region"]] == "US"])
# Correct

dim(daily_report[daily_report[["Country_Region"]] == "US", ])
## [1] 3266   14
dim(daily_report[daily_report[["Country_Region"]] == "Russia", ])
## [1] 83 14
dim(daily_report[daily_report[["Country_Region"]] == "Taiwan*", ])
## [1]  1 14


n_rows <- table(daily_report[["Country_Region"]])
n_rows
n_rows <- sort(n_rows, decreasing = TRUE)
n_rows

# Including bar 1.
barplot(n_rows[1:10], las=2)
# Excluding bar 1.
barplot(n_rows[2:10], las=2)



# Exploring bivariate data
# Using line plot to explore the trend of bivariate data
plot(aapl)

plot(amzn)

# Volumn of trading.
plot(AAPL)

# Adjustment of trading.
plot(AAPL$AAPL.Adjusted)


library(tidyr)

# Getting real-world data: Covid 19 time series
read_time_series <- function() {
  file_url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
  time_series <- read.csv(file_url, stringsAsFactors = FALSE)
  return(time_series) 
}
time_series <- read_time_series()

# Filter time series.
# Because data is on single row.
# Adjusting the data format of Covid 19 time series
col_names <- colnames(time_series)
cols_to_pivot <- col_names[5:length(col_names)]
time_series_longer <- time_series %>% 
  pivot_longer(cols = cols_to_pivot, names_to = "Date", values_to = "Confirmed") %>% 
  as.data.frame()
str(time_series_longer)

##'data.frame':	57456 obs. of  6 variables:
##  $ Province.State: chr  "" "" "" "" ...
##  $ Country.Region: chr  "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
##  $ Lat           : num  33.9 33.9 33.9 33.9 33.9 ...
##  $ Long          : num  67.7 67.7 67.7 67.7 67.7 ...
##  $ Date          : chr  "X1.22.20" "X1.23.20" "X1.24.20" "X1.25.20" ...
##  $ Confirmed     : int  0 0 0 0 0 0 0 0 0 0 ...

# Transforming date column from character to Date
date_col <- time_series_longer[["Date"]]
# Remove X.
date_col <- sub(pattern = "X", replacement = "", date_col)
# Change format of date. 
date_col <- as.Date(date_col, format = "%m.%d.%y")
time_series_longer[["Date"]] <- date_col
str(time_series_longer)
## 'data.frame':    56392 obs. of  6 variables:
##  $ Province.State: chr  "" "" "" "" ...
##  $ Country.Region: chr  "Afghanistan" "Afghanistan" "Afghanistan" "Afghanistan" ...
##  $ Lat           : num  33.9 33.9 33.9 33.9 33.9 ...
##  $ Long          : num  67.7 67.7 67.7 67.7 67.7 ...
##  $ Date          : Date, format: "2020-01-22" "2020-01-23" ...
##  $ Confirmed     : int  0 0 0 0 0 0 0 0 0 0 ...

time_series_longer %>% 
  filter(Country.Region == 'Taiwan*') %>% 
  ggplot(aes(x = Date, y = Confirmed)) +
  geom_line()

# Check confirmed cases of Taiwan.
time_series_longer[time_series_longer[["Country.Region"]] == "Taiwan*", ]

confirmed_tw <- time_series_longer[time_series_longer[["Country.Region"]] == "Taiwan*", ]
confirmed_tw[["Confirmed"]]

# Find out daily new reported case.
diff(confirmed_tw[["Confirmed"]])

# Using scatter plot to explore the relationship of numeric bivariate data
plot(aapl, amzn)
