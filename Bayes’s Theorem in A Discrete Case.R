# Our prior knowledge about a stock
# The price will rise on any given day is either 0.4 or 0.6.

# P(θ=0.4)=0.5
# P(θ=0.6)=0.5

# Say, we observe the stock for five consecutive days of price rise
# A=The event that the prices rises on five consecutive days

# Our belief that θ is 0.6 was 0.5 before event A, but is 0.8836 after observing event.

library(quantmod)

start_date <- "2018-01-01"
getSymbols(Symbols = "AAPL", from = start_date) # create a AAPL xts object in global environment

# Our prior knowledge about AAPL
# P(θ=0.55)=0.8
# P(θ=0.5)=0.2

is_rise <- diff(as.vector(coredata(AAPL$AAPL.Adjusted))) >= 0

is_rise

table(is_rise)

prop.table(table(is_rise))

# The observation A
is_rise[(length(is_rise) - 4):length(is_rise)]
## [1]  TRUE FALSE  TRUE FALSE FALSE

# We may suspect that θ is 0.5, not 0.55
p_conditional <- (0.5^5)*0.2 / ((0.5^5)*0.2 + (0.55^2 * 0.45^3)*0.8)
p_conditional
## [1] 0.2208305

# Our belief that θ is 0.5 was 0.2 before event A, but is 0.2208305 after observing event.

# The importance of Bayes’s theorem:
# 1. It tells us exactly how to update our beliefs in light of new information
# 2. Revising beliefs after receiving additional information is something that humans do poorly
# 3. There is a human tendency to put either too little or too much emphasis on new information