### apply ###
# Apply Functions Over Array Margins
# Returns a vector or array or list of values
# obtained by applying a function to margins of an array or matrix.
# 對陣列或矩陣做一個function並將直傳回成vector array list的形式
x <- matrix(1:24, nrow=4)
x
apply(x, 1, sum)  #1: rows, 2:columns
apply(x, 2, sum)

apply(x, 1, sqrt)  #apply function to the individual elements
apply(x, 2, sqrt)
# 成績開根號成以十
math <- sample(1:100, 50, replace=T)
english <- sample(1:100, 50, replace=T)
algebra <- sample(1:100, 50, replace=T)
ScoreData <- cbind(math, english, algebra)
head(ScoreData, 5)
myfun <- function(x){
   sqrt(x)*10
   }
sdata1 <- apply(ScoreData, 2, myfun)
head(sdata1, 5)
### tapply ###
# Apply a Function Over a “Ragged” Array
# Apply a function to each cell of a ragged
# array, that is to each (non-empty) group of values
# given by a unique combination of the levels of certain
# factors. 回傳的是array，對資料的某個值，依照給定的類別做fucntion
tapply(iris$Sepal.Length, iris$Species, sum)
tapply(iris$Sepal.Width, iris$Species, mean)

set.seed(12345)
scores <- sample(0:100, 50, replace=T)
grade <- as.factor(sample(c("大一", "大二", "大三", "大四"), 50, replace=T))
bloodtype <- as.factor(sample(c("A","AB","B","O"), 50, replace=T))

tapply(scores, grade, mean)
tapply(scores, bloodtype, mean)
tapply(scores, list(grade, bloodtype), mean)
#
n <- 20
my.factor <- factor(rep(1:3, length = n), levels = 1:5)
table(my.factor)
tapply(1:n, my.factor, sum)
tapply(1:n, my.factor, range)

presidents
class(presidents)
cycle(presidents)
tapply(presidents, cycle(presidents), mean, na.rm=T)
### lapply ###
# returns a list of the same length as X, each element of which is
# the result of applying FUN to the corresponding element of X. 
# 回傳的是list
a <- c("a", "b", "c", "d")
b <- c(1, 2, 3, 4, 4, 3, 2, 1)
c <- c(T, T, F)
list.object <- list(a,b,c)
my.la1 <- lapply(list.object, length)
my.la1

my.la2 <- lapply(list.object, class)
my.la2

x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
lapply(x, mean) # return list
# median and quartiles for each list element
lapply(x, quantile, probs = 1:3/4)

### sapply ###
# is a user-friendly version and wrapper of lapply by default
# returning a vector, matrix or, if simplify = "array", an array if
# appropriate, by applying simplify2array(). 
# sapply(x, f, simplify = FALSE, USE.NAMES = FALSE) is the same as lapply(x, f). 
# sapply 回傳的是原本的格式 / lapply回傳的是list
x <- list(a = 1:10, beta = exp(-3:3), logic = c(TRUE,FALSE,FALSE,TRUE))
sapply(x, mean) 
sapply(x, quantile)
lapply(x, quantile) # compare with lapply

i37 <- sapply(3:7, seq)
sapply(i37, fivenum)

v <- structure(10*(5:7), names = LETTERS[1:3])
f2 <- function(x, y) outer(rep(x, length.out = 3), y)
sapply(v, f2, y = 1:4, simplify = "array")
sapply(v, f2, y = 1:4)

my.list <- list(name=c("George", "John", "Tom"),
                 wife=c("Mary", "Sue", "Nico"),
                 no.children=c(3, 2, 0),
                 child.ages=list(c(4,7,9), c(2, 5), NA))
# 取出某一家庭的資訊
my.list[[1]][1]
my.list[[2]][1]
my.list[[3]][1]
my.list[[4]][1]
my.list[[1:4]][1] # error 遞迴索引在 2 層失敗
George.family <- sapply(my.list,"[[", 1) #"[[" 跟 "[" 是 operator (運算子)

### mapply ### 
# Apply a Function to Multiple List or Vector Arguments
# ...: further arguments to be passed to or from othermethods: times, each,length.out.
mapply(rep, 1:4, 4:1)
mapply(rep, times = 1:4, x = 4:1)
mapply(rep, times = 1:4, MoreArgs = list(x = 42))
mapply(function(x, y) seq_len(x) + y,
        c(a = 1, b = 2, c = 3),
        c(A = 10, B = 0, C = -10)) # ???
word <- function(C, k) paste(rep.int(C, k), collapse = "")
mapply(word, LETTERS[1:6], 6:1, SIMPLIFY = FALSE)

str(mapply(word, LETTERS[1:6], 6:1, SIMPLIFY = FALSE))
### rapply ###
# Recursively Apply a Function to a List
# rapply is a recursive 遞迴的 version of lapply
mydata <- list(list(a = pi, b = list(c = 1:1)), d = "a test")
mydata
rapply(mydata, sqrt, classes = "numeric", how = "replace")
rapply(mydata, nchar, classes = "character",deflt = as.integer(NA), how = "list")
rapply(mydata, log, classes =
         "numeric", how = "replace", base = 2)
rapply(mydata, nchar, classes = "character",deflt = as.integer(NA), how = "unlist")
rapply(mydata, nchar, classes = "character",
       how = "unlist")
