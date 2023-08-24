#' title "Report week2"
#' output "html_document"
#' date "2023 August 22"
#' author "Wade Burris" 

# vector ------------------------------------------------------------------

#ex.1a manually create a vector using c()
x <- c(1,3,4,8)
x

#ex.1b character
x <- c("a", "b", "c")
x

#ex.1c logical
x <- c(TRUE, FALSE, FALSE)
x

#ex.2 sequence of numbers
x <- 1:5
x

#ex.3a replicate same numbers or characters
x <- rep(2, 5) # replicate 2 five times
x

#ex.3b replicate same numbers or characters
x <- rep("a", 5) # replicate "a" five times
x

#ex.4a use seq() function
x <- seq(1, 5, by = 1)
x

#ex.4b use seq() function
x <- seq(1, 5, by = 0.1)
x

x <- c(1.2, 3.1, 4.0, 8.2)
x
class(x)
typeof(x)
length(x)
sum(x)
mean(x)

y <- c("a", "b", "c")
class(y)
length(y)


# access ------------------------------------------------------------------


x <- c(2,2,3,2,5)
x[2] # access element #2
x[c(2,3,4)]
x[2:4]

# creating a vector
x <- c(2,2,3,2,5)

# ex.1a equal
x == 2

# ex.1b larger than
x > 2 

# ex.2a equal
x[x == 2]

# ex.3a equal
which(x == 2) # returns which elements are equal to 2

# ex.3b larger than
which(x > 2)


# matrix ------------------------------------------------------------------

#ex.1 cbind: combine objects by column
x <- cbind(c(1,2,3), c(4,5,6))
x

#ex.2 rbind: combine objects by row
x <- rbind(c(1,2,3), c(4,5,6))
x

#ex.3 matrix: specify elements and the number of rows (nrow) and columns (ncol)
x <- matrix(1:9, nrow = 3, ncol = 3)
x


# check features ----------------------------------------------------------

class(x)
typeof(x)
dim(x)


# access ------------------------------------------------------------------
# rows come before columns

x <- matrix(1:9, nrow = 3, ncol = 3)
x

x[2,3] # access an element in row #2 and colum #3
x[2,]

x == 2

which(x == 2, arr.ind = TRUE)

# data frame --------------------------------------------------------------

# Create data frame
x <- c("Pristine", "Pristine", "Disturbed", "Disturbed", "Pristine") # Lake type
y <- c(1.2, 2.2, 10.9, 50.0, 3.0) # TSS: total suspended solids (mg/L)
df0 <- data.frame(LakeType = x, TSS = y) # x is named as "LakeType" while y is named as "TSS"
df0

colnames(df0) # call column names
df0$LakeType # access LakeType
df0$TSS
df0[c(2,4),] # access row #2 and 4


# exercise ----------------------------------------------------------------

v1 <- c(1:3)
v2 <- c(1:6)
v3 <- seq (1,20, by = 1)

va <- c("a", "b", "c")
vb <- rep("a", 6)
vc <- character(20)

set.seed(1)
x <- rnorm(100)

z <- which(x > 2)
x > 2
meanx <- mean(z)

x <- cbind(c(1,1,1,1), c(1,1,1,1), c(1,1,1,1), c(1,1,1,1))
x

x <- cbind(c("a","a","a","a"), c("a","a","a","a"), c("a","a","a","a"), c("a","a","a","a"))
x

typeof(x)

set.seed(1)
x <- matrix(rnorm(100), nrow = 10, ncol = 10)
z <- which(x > 2)
z
x > 2
meanx <- mean(z)
meanx

x <- c("a", "b", "c", "d", "e", "f", "g","h", "i", "j")
y <- c(1:10) 
z <- c(11:20)

df0 <- data.frame(character = x, numeric1 = y, numeric2 = z) 
df0
class(df0)
typeof(df0)
dim(df0)

set.seed(1)
x <- rnorm(100, mean = 10, sd = 3)
y <- rpois(100, lambda = 10)
z <- rep(c("VA", "NC"), 50)
df0 <- data.frame(temperature = x, abundance = y, state = z)
df0

df0 

a <- seq(1, 99, by = 2)
b <- seq(2, 100, by = 2)

VA <- df0[a,]
NC <- df0[b,]

tempVA <- mean(VA$temperature)
tempNC <- mean(NC$temperature)
tempVA #mean temperature in VA
tempNC #mean temperature in NC

abdVA <- mean(VA$abundance)
abdNC <- mean(NC$abundance)
abdVA #mean abundance in VA
abdNC #mean abundance in NC

#alt shift o 


# tidyverse ---------------------------------------------------------------


#install.packages("tidyverse")
library(tidyverse)


iris <- as_tibble(iris)
iris

# filter -----------

# single match "=="
filter(iris, Species == "virginica")

# multiple match "%in%"
filter(iris, Species %in% c("virginica", "versicolor"))

# except "!="
filter(iris, Species != "virginica")

# except multiple "!(x %in% c("a", "b"))
filter(iris, !(Species %in% c("virginica", "versicolor")))

# greater than ">"
filter(iris, Sepal.Length > 5)

# equal & greater than ">="
filter(iris, Sepal.Length >= 5)

# less than "<"
filter(iris, Sepal.Length < 5)

# equal & less than "<="
filter(iris, Sepal.Length <= 5)


# arrange -----------------------------------------------------------------

# arrange in an ascending order
arrange(iris, Sepal.Length)

# arrange in an descending order
arrange(iris, desc(Sepal.Length))
# select one column
select(iris, Sepal.Length)


# select ------------------------------------------------------------------


# select multiple columns
select(iris, c(Sepal.Length, Sepal.Width))

# remove one column
select(iris, -Sepal.Length)

# remove multiple columns
select(iris, -c(Sepal.Length, Sepal.Width))

# select/remove multiple columns with a start rule
# starts_with("x")
select(iris, starts_with("Sepal"))
select(iris, -starts_with("Sepal"))

# select/remove multiple columns with an end rule
# ends_with("x")
select(iris, ends_with("Width"))
select(iris, -ends_with("Width"))


# mutate ------------------------------------------------------------------

# add a new column
x <- 1:150
mutate(iris, oowee = x)


# piping ------------------------------------------------------------------


# the following codes produce the same data frame
# apply functions separately
df_vir <- filter(iris, Species == "virginica")
df_vir_sl <- select(df_vir, Sepal.Length)
print(df_vir_sl)

# piping (command shift m)
iris %>% 
  filter(Species == "virginica") %>% 
  select(Sepal.Length)


# group operations --------------------------------------------------------


# grouping by "Species", then take means "Speal.Length" for each species
iris %>% 
  group_by(Species) %>% 
  summarize(mu_sl = mean(Sepal.Length))

# grouping by "Species", then take means & SD "Speal.Length" for each species
iris %>% 
  group_by(Species) %>% 
  summarize(mu_sl = mean(Sepal.Length),
            sd_sl = sd(Sepal.Length))

# matching by a single column
## left join by "Species": one to one
df1 <- tibble(Species = c("A", "B", "C"),
              x = c(1, 2, 3))

df2 <- tibble(Species = c("A", "B", "C"),
              y = c(4, 5, 6))

left_join(x = df1,
          y = df2,
          by = "Species")


# Tidyverse exercises 1-4 -------------------------------------------------


