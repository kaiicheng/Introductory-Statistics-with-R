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