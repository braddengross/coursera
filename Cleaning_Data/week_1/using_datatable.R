library(data.table)
DF = data.frame(x=rnorm(9),y=rep(c("a","b","c"), each=3), z=rnorm(9))
head(DF,3)
DT = data.table(x=rnorm(9),y=rep(c("a","b","c"), each=3), z=rnorm(9))
tables()
head(DT,3)
#Add a new column
DT[,w:=z^2]

#Counting large datasets
set.seed(123)
#100K reps of A B C
DT <- data.table(x=sample(letters[1:3], 1E5, TRUE))
#.n is some special variable which is an integer of length 1
#Counts by col x
DT[, .N, by=x]

#Data tables have keys unlink data frame. Can be used for subsetting and joins
DT <- data.table(x=rep(c("a","b","c"), each=100), y=rnorm(300))
setkey(DT, x)
#Subset by key is much faster
DT['a']
