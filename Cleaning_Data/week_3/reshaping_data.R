library(reshape2)
head(mtcars)

#Reshaping data
mtcars$carname <- rownames(mtcars)
carMelt <- melt(mtcars, id=c("carname", "gear", "cyl"), measure.vars = c("mpg", "hp"))
head(carMelt, n=3)

cylData <- dcast(carMelt, cyl ~ variable)
cylData

cylData <- dcast(carMelt, cyl ~ variable, mean)
cylData

#Averaging values
head(InsectSprays)
tapply(InsectSprays$count, InsectSprays$spray, sum)

#Split apply combin
spIns = split(InsectSprays$count, InsectSprays$spray)
spIns

sprCount = lapply(spIns, sum)
sprCount

#Combine = back to vector
unlist(sprCount)

sapply(spIns, sum)

#Plyr package
ddply(InsectSprays, .(spray), summarize, sum=sum(count))

#Creating a new var
spraySums <- ddply(InsectSprays,.(spray),summarize,sum=ave(count,FUN=sum))
dim(spraySums)
head(spraySums)
