# Flipping a coin
coin <- c("Head", "Tail")
# Replace => Return and can be chose again.
# Replace defaulted FALSE.
sample(coin, size = 1, replace = TRUE)
## [1] "Head"

?sample

help(sample)

# Size > sample but Return is FALSE.
coin <- c("Head", "Tail")
sample(coin, size = 5)
# Error in sample.int(length(x), size, replace, prob) : 
#   當 'replace = FALSE' 時不能取用比總體還要大的樣本

# Size > sample and Return is TRUE.
coin <- c("Head", "Tail")
sample(coin, size = 5, replace = TRUE)

# Probability defaulted 50% and 50%.
coin <- c("Head", "Tail")
coin_toss <- sample(coin, size = 1000, replace = TRUE)
table(coin_toss)

# Probability is 75%/ 25%.
coin <- c("Head", "Tail")
coin_toss <- sample(coin, size = 1000, replace = TRUE, prob = c(0.75, 0.25))
table(coin_toss)

# Rolling a dice for 2 times
dice <- 1:6
sample(dice, size = 2, replace = TRUE)
## [1] 5 5

# The replace argument:
# 1. replace = TRUE refers to independent events
# 2. replace = FALSE refers to dependent events

# Independent vs. dependent events:
# 1. Events are independent if the probability of the latter isn’t affected by the outcome of the previous, e.g. flipping coin and rolling dice
# 2. Events are dependent if the probability of the latter is affected by the outcome of the previous, e.g. dealing cards

# Dealing poker cards
generate_poker_deck <- function() {
  suits <- c("Spades", "Hearts", "Diamonds", "Clubs")
  ranks <- c("Ace", 2:10, "Jack", "Queen", "King")
  poker_deck <- c()
  for (s in suits) {
    for (r in ranks) {
      card <- sprintf("%s of %s", r, s)
      poker_deck <- c(poker_deck, card)
    }
  }
  return(poker_deck)
}
poker_deck <- generate_poker_deck()
sample(poker_deck, size = 13, replace = FALSE)

# Binomial distribution
help(rbinom)

# Flipping size coin(s) for n time(s) with built-in function rbinom()
rbinom(n = 1, size = 1, prob = 0.5)  # single flip, single time
## [1] 0
rbinom(n = 3, size = 1, prob = 0.5)  # single flip, many times
## [1] 1 0 1
rbinom(n = 1, size = 3, prob = 0.5)  # many flips, single time
## [1] 1
rbinom(n = 20, size = 3, prob = 0.5) # many flips, many times
##  [1] 1 1 2 2 2 1 2 0 1 2 1 1 2 2 3 2 0 2 2 1

# Other associated built-in functions for binomial distribution:
# 1. dbinom()
# 2. pbinom()

# dbinom()
# dbinom() function measures the probability of getting x successes out of size trials
dbinom(x = 0, size = 10, prob = 0.5) # the probability of getting 0 head out of 10 times of single flip
## [1] 0.0009765625
dbinom(x = 1, size = 10, prob = 0.5) # the probability of getting 1 head out of 10 times of single flip
## [1] 0.009765625
dbinom(x = 2, size = 10, prob = 0.5) # the probability of getting 2 heads out of 10 times of single flip
## [1] 0.04394531

n_head <- 0:10
n_head_probs <- dbinom(x = n_head, size = 10, prob = 0.5)
barplot(n_head_probs, names.arg = n_head, ylim = c(0, 0.25), main = "Probability of getting n heads out of 10 times")

# pbinom() => sum up/ accumulate
# pbinom() function measures the probability of getting less than or equal to x successes out of size trials
pbinom(q = 0, size = 10, prob = 0.5) # the probability of getting less than or equal to 0 head out of 10 times of trials
## [1] 0.0009765625
pbinom(q = 1, size = 10, prob = 0.5) # the probability of getting less than or equal to 0 head out of 10 times of trials
## [1] 0.01074219
dbinom(x = 0, size = 10, prob = 0.5) + dbinom(x = 1, size = 10, prob = 0.5)
## [1] 0.01074219

# accumulate from probability of q from 0 to 10.
pbinom(q = 10, size = 10, prob = 0.5)


# What if we want to measure the probability of getting more than x successes out of size trials
1 - pbinom(q = 1, size = 10, prob = 0.5)
## [1] 0.9892578
pbinom(q = 1, size = 10, prob = 0.5, lower.tail = FALSE)
## [1] 0.9892578

# Law of Large Number
# As the size of sample increases, the sample mean will approach the expected value

# Flipping a coin for 10 times
coin_flips <- rbinom(10, size = 1, prob = 0.5)
p_head <- sum(coin_flips) / length(coin_flips)
p_head
## [1] 0.6

# Flipping a coin for 1000 times
coin_flips <- rbinom(1000, size = 1, prob = 0.5)
p_head <- sum(coin_flips) / length(coin_flips)
p_head
## [1] 0.505

# The average points of rolling a dice
mean(1:6)
## [1] 3.5

# Rolling a dice for 10 times
dice <- 1:6
dice_rolls <- sample(dice, size = 10, replace = TRUE)
mean(dice_rolls)
## [1] 3.7
hist(dice_rolls, breaks = 0:6)

# Rolling a dice for 100 times
dice_rolls <- sample(dice, size = 100, replace = TRUE)
mean(dice_rolls)
## [1] 3.43
hist(dice_rolls, breaks = 0:6)

# Rolling a dice for 1000 times
dice_rolls <- sample(dice, size = 100, replace = TRUE)
mean(dice_rolls)
## [1] 3.29
hist(dice_rolls, breaks = 0:6)