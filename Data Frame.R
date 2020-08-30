library(quantmod )

start_date <- "2018-01-01"
getSymbols(Symbols = "AAPL", from = start_date)
getSymbols(Symbols = "AMZN", from = start_date)

aapl_df <- data.frame(AAPL)
amzn_df <- data.frame(AMZN)

aapl_df <- data.frame(AAPL)
amzzn_df <-data.frame(AMZN)
View(aapl_df)

# Filter and Clean data.
col_names <- c("Open", "High", "Low", "Close", "Volume", "Adjusted")
trading_dates <- row.names(aapl_df)
colnames(aapl_df) <- col_names
colnames(amzn_df) <- col_names
aapl_df$Ticker <- "AAPL"
amzn_df$Ticker <- "AMZN"
aapl_df$Ticker <- as.character(aapl_df$Ticker)
amzn_df$Ticker <- as.character(amzn_df$Ticker)
aapl_df$TradingDate <- trading_dates
amzn_df$TradingDate <- trading_dates
row.names(aapl_df) <- NULL
row.names(amzn_df) <- NULL

# Merge two data frames.
combined_df <- rbind(aapl_df, amzn_df)
combined_df <- combined_df[c("TradingDate", "Ticker", "Open", "High", "Low", "Close", "Volume", "Adjusted")]

plot(AAPL)
plot(AAPL$AAPL.Adjusted)

plot(AMZN)
plot(AMZN$AMZN.Adjusted)

str(combined_df)


# Create plot with two data frames.
# different line colors
combined_df$TradingDate <- base::as.Date(combined_df$TradingDate)

# Structure()
str(combined_df)

# Check Date() function 
?as.Date
# Two packages have Date() function => choose base::as.Date
# ?base::as.Date
# ?zoo::as.Date

library(ggplot2)

# Draw plot.
# ggplot(resource, aes(x = TradingDate, y = Adjusted,))

# Create a coordinate system.
p <- ggplot(combined_df, aes(x = TradingDate, y = Adjusted))
p  

p + geom_line()

# Create 2 different color lines.                       
p <- ggplot(combined_df, aes(x = TradingDate, y = Adjusted, col = Ticker))
p + geom_line()

# Create two different type.
p <- ggplot(combined_df, aes(x = TradingDate, y = Adjusted, linetype = Ticker ))
p + geom_line()

# Create two different type and color lines.
p <- ggplot(combined_df, aes(x = TradingDate, y = Adjusted, col = Ticker, linetype = Ticker ))
p + geom_line()

# Combine ggplot(...) + geom_line()
p <- ggplot(combined_df, aes(x = TradingDate, y = Adjusted, col = Ticker, linetype = Ticker)) + geom_line()

p


# Getting real-world data: Covid 19 time series
read_time_series <- function() {
  file_url <- "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
  time_series <- read.csv(file_url, stringsAsFactors = FALSE)
  return(time_series)
}
time_series <- read_time_series()

head(time_series)

# Adjusting the data format of Covid 19 time series
library(tidyr)

# Change into long shape.
col_names <- colnames(time_series)
cols_to_pivot <- col_names[5:length(col_names)]
# Assign time_series as input of pivot_longer
time_series_longer <- time_series %>% 
  pivot_longer(cols = cols_to_pivot, names_to = "Date", values_to = "Confirmed") %>% 
  as.data.frame()

# Transforming date column from character to Date
date_col <- time_series_longer[["Date"]]
date_col <- sub(pattern = "X", replacement = "", date_col)
date_col <- as.Date(date_col, format = "%m.%d.%y")
time_series_longer[["Date"]] <- date_col
str(time_series_longer)

time_series_longer

str(time_series)

str(time_series_longer)

# %>%
sqrt(1:10)
sum(sqrt(1:10))

# Above code is equal to this. 
1:10 %>%
  sqrt() %>%
  sum()

# %>%
sum(sqrt(rep(sum(sqrt(1:10)), 10)))
    
# Above code is equal to this. 
1:10 %>%
  sqrt() %>%
  sum() %>%
  rep(10) %>%
  sqrt() %>%
  sum()

# List all types.
unique(time_series_longer$Country.Region)

# List all data.
time_series_longer$Country.Region

# Line of Taiwan.
p <- time_series_longer %>% 
  filter(Country.Region == "Taiwan*") %>% 
  ggplot(aes(x = Date, y = Confirmed, col = Country.Region)) +
  geom_line()   
p

# Line of China.
p <- time_series_longer %>% 
  filter(Country.Region == "China") %>% 
  ggplot(aes(x = Date, y = Confirmed, col = Province.State)) +
  geom_line()   
p

# Line of Canada.
p <- time_series_longer %>% 
  filter(Country.Region == "Canada") %>% 
  ggplot(aes(x = Date, y = Confirmed, col = Province.State)) +
  geom_line()   
p

# Different line colors
library(dplyr)
p <- time_series_longer %>% 
  filter(Country.Region %in% c("Taiwan*", "Japan", "Korea, South", "Singapore")) %>% 
  ggplot(aes(x = Date, y = Confirmed, col = Country.Region)) +
  geom_line()  
p

# different boxes
p <- ggplot(combined_df, aes(x = Ticker, y = Adjusted, fill = Ticker)) + 
  geom_boxplot()
p

# Two historams in the same plot.
p <- ggplot(combined_df, aes(x = Adjusted, fill = Ticker)) + 
geom_histogram(bins = 30) 
p

# different histograms sharing same scale.
p <- ggplot(combined_df, aes(x = Adjusted, fill = Ticker)) + 
  geom_histogram(bins = 30) +
  facet_wrap(~ Ticker)
p


# different histograms sharing different scales.
p <- ggplot(combined_df, aes(x = Adjusted, fill = Ticker)) + 
  geom_histogram(bins = 30) +
  facet_wrap(~ Ticker, scales = "free")
p