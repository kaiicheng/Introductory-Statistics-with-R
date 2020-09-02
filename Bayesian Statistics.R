# What is Bayesian statistics?

# The definition:
# Bayesian statistics is a mathematically rigorous method for updating your beliefs based on evidence.

# Bayes’ Theorem
# P(A|B)=P(B|A)/ P(A)P(B)

# Revisiting the Monty Hall problem
# Ci:Car is at the i-th door 
# Hi:The host opens the i-th door
# Xi:The contestant chooses the i-th door

# The winning probability of “stick”
# P(C1|H3 and X1)

# The winning probability of “switch”
# P(C2|H3andX1)


# Updating from evidence

# For example: Is my coin fair?
p_head_fair <- 0.5
p_head_biased <- 0.75
fair_coin <- rbinom(10000, 1, prob = p_head_fair)
biased_coin <- rbinom(10000, 1, prob = p_head_biased)
n_heads_fair <- sum(fair_coin)
n_heads_biased <- sum(biased_coin)
n_heads_fair
## [1] 5005
n_heads_biased
## [1] 7501

# The probability of flipping a head: P(Head)
p_head <- (n_heads_fair + n_heads_biased) / (length(fair_coin) + length(biased_coin))
p_head
## [1] 0.6253

# The probability of flipping a fair coin: P(Fair)
p_fair <- length(fair_coin) / (length(fair_coin) + length(biased_coin))
p_fair
## [1] 0.5

# Given a flip of head, what is the probability that it is a fair coin?
# P(Fair|Head)=P(Head|Fair)* P(Fair)/P(Head)
p_head_fair * p_fair / p_head
## [1] 0.3998081

# Given a flip of head, what is the probability that it is a biased coin?
# P(Biased|Head)=P(Head|Biased)*P(Biased)/P(Head)
p_biased <- length(biased_coin) / (length(fair_coin) + length(biased_coin))
p_head_biased * p_biased / p_head
## [1] 0.5997121

# Is my coin fair? Coins with different flips
p_head_fair <- 0.5
p_head_biased <- 0.75
fair_coin <- rbinom(10000, 1, prob = p_head_fair)
biased_coin <- rbinom(5000, 1, prob = p_head_biased)
n_heads_fair <- sum(fair_coin)
n_heads_biased <- sum(biased_coin)
n_heads_fair
## [1] 5043

n_heads_biased
## [1] 3764

# The probability of flipping a head: P(Head)
p_head <- (n_heads_fair + n_heads_biased) / (length(fair_coin) + length(biased_coin))
p_head
## [1] 0.5871333

# The probability of flipping a fair coin: P(Fair)
p_fair <- length(fair_coin) / (length(fair_coin) + length(biased_coin))
p_fair
## [1] 0.6666667

# Given a flip of head, what is the probability that it is a fair coin?
# P(Fair|Head)=P(Head|Fair)*P(Fair)/P(Head)
p_head_fair * p_fair / p_head
## [1] 0.5677302

# Given a flip of head, what is the probability that it is a biased coin?
# P(Biased|Head)=P(Head|Biased)*P(Biased)/P(Head)
p_biased <- length(biased_coin) / (length(fair_coin) + length(biased_coin))
p_head_biased * p_biased / p_head
## [1] 0.4257977