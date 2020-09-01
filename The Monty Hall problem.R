# Contestant randomly pick 1 from 3 doors
initial_pick <- sample(1:3, size = 1)
initial_pick
## [1] 1

# Monty Hall will then reveal an empty door
# Ask the contestant, “stick or switch?”

# Simulating the winning probability of “stick”
winning_prob_stick <- function(n_simulations = 10000) {
  doors <- c(1,2,3)
  n_wins <- 0
  for(i in 1:n_simulations){
    prize <- sample(doors, size = 1)
    initial_pick <- sample(doors, size = 1)
    
    # Situation of winning.
    if(initial_pick == prize){
      n_wins <- n_wins + 1
    }
  }
  winning_prob <- n_wins / n_simulations
  return(winning_prob)
}

# Default 10000 times.
winning_prob_of_stick <- winning_prob_stick()
winning_prob_of_stick

# Simulate 10 times.
winning_prob_stick(10)

# Stick => Probability to win is closed to 1/3.

# The “reveal strategy” of Monty Hall
# 1. If the initially pick is correct, then Monty Hall will choose one of the other two doors at random to reveal
# 2. If the initially pick is incorrect, then the host will simply reveal the other incorrect door, nothing random at this point

# [-1]
doors <- 1:3
doors[-3]
doors[-2]
doors[-1]

initial_pick

prize <- sample(doors, size = 1)
prize

doors[-c(prize, initial_pick)]



reveal_strategy <- function(doors, prize, initial_pick){
  # Situation of guessing correctly
  if (prize == initial_pick) {
    reveal <- sample(x = doors[-prize], size = 1) # Sample at random from the two remaining doors
  } else {
  # Situation of guessing wrong
    reveal <- doors[-c(prize, initial_pick)] # When the prize and initial pick are different, reveal the remaining door
  }
  return(reveal)
}


# Simulating the winning probability of “switch”
winning_prob_switch <- function(n_simulations = 10000) {
  doors <- c(1,2,3)
  n_wins <- 0
  for(i in 1:n_simulations){
    prize <- sample(doors, size = 1)
    initial_pick <- sample(doors, size = 1)
    reveal <- reveal_strategy(doors, prize, initial_pick) # reveal according to reveal_strategy
    final_pick <- doors[c(-initial_pick, -reveal)] # switch
    if (final_pick == prize) {
      n_wins <- n_wins + 1
    }
  }
  winning_prob <- n_wins / n_simulations
  return(winning_prob)
}

winning_prob_of_switch <- winning_prob_switch()
winning_prob_of_switch 
## [1] 0.6685