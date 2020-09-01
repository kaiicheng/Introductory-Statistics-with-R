# The birthday problem

# What is the birthday problem
# There is a room(classroom?) with n people in it. What is the probability that anyone shares the same birthday?

# Assumptions of the birthday problem
# Ignore February 29th
# Each individual in the room is independent

# Using sample() to draw 40 samples from 1:365
dates_in_a_year <- format(as.Date(1:365, origin = "2019-01-01"), "%m-%d")
birthdays_num <- sample(1:365, size = 40, replace = TRUE)
birthdays <- dates_in_a_year[birthdays_num]
birthdays

length(birthdays)
length(unique(birthdays))

# Extending the sampling to 10000 times
counter <- 0
for (i in 1:10000) {
  birthdays_num <- sample(1:365, size = 40, replace = TRUE)
  if (length(unique(birthdays_num)) < length(birthdays_num)) {
    counter <- counter + 1
  }
}
p_same_birthday <- counter / 10000
p_same_birthday
## [1] 0.8879

# Defining a p_same_birthday(n) function which takes a single argument n
p_same_birthday <- function(n, n_simulations = 10000) {
  counter <- 0
  for (i in 1:n_simulations) {
    birthdays_num <- sample(1:365, size = n, replace = TRUE)
    unique_birthdays_num <- unique(birthdays_num)
    if (length(unique_birthdays_num) < length(birthdays_num)) {
      counter <- counter + 1
    }
  }
  p_same_birthday <- counter / n_simulations
  return(p_same_birthday)
}

p_same_birthday(1)
p_same_birthday(5)
p_same_birthday(10)
p_same_birthday(20)
p_same_birthday(30)

# Simulating 50 classrooms with 1 to 50 students
same_birthday_probs <- sapply(1:50, p_same_birthday)
same_birthday_probs

# Above code is equal to this code.
simulations <- c()
for (i in 1:50){
  simulations <- c(simulations, p_same_birthday((i)))
}
simulations

plot(same_birthday_probs)

