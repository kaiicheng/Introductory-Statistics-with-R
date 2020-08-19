# Saying hello from R
hello_msg <- "Hello from R!"
hello_msg # print hello_msg to console
hello_msg
print(hello_msg)

# Useful built-in functions
help(class)
class(hello_msg)
class(help)
class(print)
help(rm)
rm(hello_msg)
getwd()
sessionInfo()

# Numeric with length of 1
numeric_vector <- 5566
numeric_vector

class(numeric_vector)

length(numeric_vector)

# Numeric with length larger than 1
numeric_vector <- c(5, 5, 6, 6) # using help(c) or ?c to check what c() function is
numeric_vector

class(numeric_vector)

length(numeric_vector)

# Character with length of 1
character_vector <- "ききせせ"
character_vector

class(character_vector)

length(character_vector)

# Character with length larger than 1
character_vector <- c("き", "き", "せ", "せ")
character_vector

class(character_vector)

length(character_vector)

# Logical with length of 1
logical_vector <- TRUE
logical_vector

class(logical_vector)

length(logical_vector)

# Date with length of 1
date_vector <- Sys.Date()
date_vector

time_vector <- Sys.time()
time_vector

class(date_vector)

length(date_vector)

# Date with length larger than 1
date_vector <- c(Sys.Date(), Sys.Date() - 1, Sys.Date() - 2, Sys.Date() - 3)
date_vector

class(date_vector)

length(date_vector)

# Vectorization
numeric_vector <-c(5, 5, 6, 6)
numeric_vector**2

# if statement
wanna_fight <- TRUE
if (wanna_fight) {
  print("Fight")
}

wanna_fight <- 55 > 6
if (wanna_fight) {
  print("Fight")
}

wanna_fight <- FALSE
if (wanna_fight) {
  print("Fight!")
} else {
  print("Not fight")
}

wanna_fight <- 8 < 10
if (wanna_fight) {
  print("Fight!")
} else {
  print("Not fight")
}

# Alt + - => "<-" sign

# Esc => stop processing   (Applicable in the Console).
"""
wanna_fight <- 8 < 10
if (wanna_fight) {
  print("Fight!")
} else {
  print("Not fight")
"""

wanna_fight <- FALSE
dancing_room_is_open <- FALSE
if (dancing_room_is_open & wanna_fight) {
  print("Fight! The room room is open, so let's fight there.") 
}  else if (wanna_fight) {
  print("Fight! But check whether the room room is open or not.")
} else {
  print("Then not fight.")
}

  
# Using functions to create various data structures

# Using list() to create lists
my_list <- list(
  c(5, 5, 6, 6),
  c(TRUE, TRUE, FALSE, FALSE),
  "ききせせ"
)
my_list

class(my_list)  

# Using matrix() to create matrices
my_matrix <- matrix(c(1, 2, 3, 4, 5, 6), nrow = 3, ncol = 2)
my_matrix

class(my_matrix)

# Using data.frame() to create data frames
my_df <- data.frame(
  title = c("The Shawshank Redemption", "The Dark Knight", "Forrest Gump", "Inception"),
  year = c(1994, 2008, 1994, 2010),
  imdb_rating = c(9.2, 9, 8.8, 8.7)
)
my_df

class(my_df)

# Using array() to create arrays
my_array <- array(1:24, dim = c(4, 3, 2))
my_array

class(my_array)


# Intermediate Syntax

# Using [] to index a vector
numeric_vector <- 6:10
numeric_vector[1]

numeric_vector[2]

numeric_vector[3]

numeric_vector[4]

numeric_vector[5]

# Using [[]] to index a list
my_list <- list(
  title = c("The Shawshank Redemption", "The Dark Knight", "Forrest Gump", "Inception"),
  year = c(1994, 2008, 1994, 2010),
  imdb_rating = c(9.2, 9, 8.8, 8.7)
)

my_list[1]

class(my_list[1])

class(my_list[['title']])

my_list[['title']]

my_list[[1]] # my_list[["title"]]

my_list[[2]] # my_list[["year"]]

my_list[[3]] # my_list[["imdb_rating"]]

my_list[1]

my_list[1][[1]]

# No "." usage to get attribute in R. 
# $ sign will get attribute.
my_list$year


# Iterating with for
numeric_vector <- 6:10
for (i in numeric_vector) {
  print(i)
}

# Iterating over a list with for
my_list <- list(
  title = c("The Shawshank Redemption", "The Dark Knight", "Forrest Gump", "Inception"),
  year = c(1994, 2008, 1994, 2010),
  imdb_rating = c(9.2, 9, 8.8, 8.7)
)
for (i in my_list) {
  print(i)
}

# If and else function can omit print()
# It's necessary to use print() in iterating.

# Iterating over a vector with while
numeric_vector <- 6:10
i <- 1
while (i <= length(numeric_vector)) {
  print(numeric_vector[i])
  i <- i + 1
}

# Defining a function to convert celsius to fahrenheit
celsius_to_fahrenheit <- function(degree) {
  degree_f <- degree * 9/5 + 32
  return(degree_f)
}
celsius_to_fahrenheit(30)

celsius_degrees <- 30:35
celsius_to_fahrenheit(celsius_degrees)

# Applying a function over a list
celsius_degrees <- list(30, 31, 32, 33, 34, 35)
lapply(celsius_degrees, FUN=celsius_to_fahrenheit) # lapply as in list apply







