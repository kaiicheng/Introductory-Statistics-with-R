# and
# &
# &&
# & include &&

TRUE & FALSE
TRUE && FALSE

# Return multiple outputs.
c(TRUE, FALSE, TRUE, FALSE) & c(TRUE, FALSE, FALSE, TRUE)

# Return single output.
c(TRUE, FALSE, TRUE, FALSE) && c(TRUE, FALSE, FALSE, TRUE)

# Probability of intersection
# We can use operator & for intersection
coin_A <- rbinom(n = 10000, size = 1, prob = 0.5)
coin_B <- rbinom(n = 10000, size = 1, prob = 0.5)
mean(coin_A == 1 & coin_B == 1) # Both coin_A and coin_B are heads
## [1] 0.2523

0.5 * 0.5
## [1] 0.25


# or
# |
# ||

TRUE | FALSE
TRUE || FALSE

# Return multiple outputs.
c(TRUE, FALSE, TRUE, FALSE) | c(TRUE, FALSE, FALSE, TRUE)

# Return single output.
c(TRUE, FALSE, TRUE, FALSE) || c(TRUE, FALSE, FALSE, TRUE)

# Probability of union
# We can use operator | for union
coin_A <- rbinom(n = 10000, size = 1, prob = 0.5)
coin_B <- rbinom(n = 10000, size = 1, prob = 0.5)
mean(coin_A == 1 | coin_B == 1) # coin_A is head or coin_B is head
## [1] 0.7583

(0.5 + 0.5) - 0.5*0.5
## [1] 0.75

#　Flipping 3 coins

# intersection
coin_A <- rbinom(n = 10000, size = 1, prob = 0.5)
coin_B <- rbinom(n = 10000, size = 1, prob = 0.5)
coin_C <- rbinom(n = 10000, size = 1, prob = 0.5)
mean(coin_A == 1 & coin_B == 1 & coin_C == 1)
## [1] 0.1269

0.5**3
## [1] 0.125

# P(AorBorC) = 
# P(A)+P(B)+P(C)−(P(A)×P(B)+P(A)×P(C)+P(B)×P(C))+P(A)×P(B)×P(C)

# union
coin_A <- rbinom(n = 10000, size = 1, prob = 0.5)
coin_B <- rbinom(n = 10000, size = 1, prob = 0.5)
coin_C <- rbinom(n = 10000, size = 1, prob = 0.5)
mean(coin_A == 1 | coin_B == 1 | coin_C == 1)
## [1] 0.8738

(0.5 + 0.5 + 0.5) - (0.5**2 + 0.5**2 + 0.5**2) + 0.5**3
## [1] 0.875