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