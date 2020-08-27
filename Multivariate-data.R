# #What is multivariate data
# A multivariate data set is a set of measurements 
# for some variable from a collection of cases involving 
# multiple attributes.

# matrix for homogeneous features
# list or data.frame for heterogeneous features

library(quantmod)

# Get data of Apple Inc.
start_date <- "2018-01-01"
getSymbols(Symbols = "AAPL", from = start_date) # create a AAPL xts object in global environment
## [1] "AAPL"

# Get data of Amazon.com
getSymbols(Symbols = "AMZN", from = start_date) # create a AMZN xts object in global environment
## [1] "AMZN"

# Using matrix for a homogeneous multivariate data
amzn_matrix <- cbind(
  matrix(AMZN$AMZN.Open),
  matrix(AMZN$AMZN.High),
  matrix(AMZN$AMZN.Low),
  matrix(AMZN$AMZN.Close),
  matrix(AMZN$AMZN.Adjusted),
  matrix(AMZN$AMZN.Volume)
)

class(amzn_matrix)
## [1] "matrix"

dim(amzn_matrix)
## [1] 664   6

amzn_df <- data.frame(AMZN)

class(amzn_df)
## [1] "data.frame"

dim(amzn_df)
## [1] 664   6
## The first column is row name.

str(amzn_df)
## 'data.frame':    664 obs. of  6 variables:
##  $ AMZN.Open    : num  1172 1188 1205 1218 1236 ...
##  $ AMZN.High    : num  1190 1205 1216 1229 1253 ...
##  $ AMZN.Low     : num  1171 1188 1205 1210 1232 ...
##  $ AMZN.Close   : num  1189 1204 1210 1229 1247 ...
##  $ AMZN.Volume  : num  2694500 3108800 3022100 3544700 4279500 ...
##  $ AMZN.Adjusted: num  1189 1204 1210 1229 1247 ...


# Combining 2 data.frame objects
col_names <- c("Open", "High", "Low", "Close", "Volume", "Adjusted")

aapl_df <- data.frame(AAPL)

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

head(aapl_df)

dim(aapl_df)

665*2

# Combine row of AAPL and AMZN data.

combined_df <- rbind(aapl_df, amzn_df)
combined_df <- combined_df[c("TradingDate", "Ticker", "Open", "High", "Low", "Close", "Volume", "Adjusted")]

head(combined_df)
##   TradingDate Ticker   Open   High    Low  Close   Volume Adjusted
## 1  2018-01-02   AAPL 170.16 172.30 169.26 172.26 25555900 166.0543
## 2  2018-01-03   AAPL 172.53 174.55 171.96 172.23 29517900 166.0254
## 3  2018-01-04   AAPL 172.54 173.47 172.08 173.03 22434600 166.7966
## 4  2018-01-05   AAPL 173.44 175.37 173.05 175.00 23660000 168.6956
## 5  2018-01-08   AAPL 174.35 175.61 173.93 174.35 20567800 168.0690
## 6  2018-01-09   AAPL 174.55 175.06 173.41 174.33 21584000 168.0497

tail(combined_df)
##      TradingDate Ticker    Open    High     Low   Close  Volume Adjusted
## 1323  2020-08-13   AMZN 3182.99 3217.52 3155.00 3161.02 3149000  3161.02
## 1324  2020-08-14   AMZN 3178.18 3178.24 3120.00 3148.02 2751700  3148.02
## 1325  2020-08-17   AMZN 3173.12 3194.97 3154.18 3182.41 2691200  3182.41
## 1326  2020-08-18   AMZN 3212.00 3320.00 3205.82 3312.49 5346000  3312.49
## 1327  2020-08-19   AMZN 3303.01 3315.90 3256.00 3260.48 4185100  3260.48
## 1328  2020-08-20   AMZN 3252.00 3312.62 3238.00 3297.37 3325100  3297.37

# Turn numeric data into str type
str(combined_df)
## 'data.frame':    1328 obs. of  8 variables:
##  $ TradingDate: chr  "2018-01-02" "2018-01-03" "2018-01-04" "2018-01-05" ...
##  $ Ticker     : chr  "AAPL" "AAPL" "AAPL" "AAPL" ...
##  $ Open       : num  170 173 173 173 174 ...
##  $ High       : num  172 175 173 175 176 ...
##  $ Low        : num  169 172 172 173 174 ...
##  $ Close      : num  172 172 173 175 174 ...
##  $ Volume     : num  25555900 29517900 22434600 23660000 20567800 ...
##  $ Adjusted   : num  166 166 167 169 168 ...

aapl <- as.vector(coredata(AAPL$AAPL.Adjusted))
amzn <- as.vector(coredata(AMZN$AMZN.Adjusted))

# Summaries of 2 categorical vectors.
# Create check whether stock prices are rising or not.
price_diff_aapl <- diff(aapl)
price_diff_amzn <- diff(amzn)
is_rise_aapl <- price_diff_aapl >= 0
is_rise_amzn <- price_diff_amzn >= 0


length(aapl)

length(is_rise_aapl)


