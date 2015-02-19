install.packages("dplyr")
library(dplyr)

chicago <- readRDS("chicago.rds")
dim(chicago)
str(chicago)
names(chicago)
head(select(chicago, city:dptp))
head(select(chicago, -(city:dptp)))

#Matching
i <- match("city", names(chicago))
j <- match("dptp", names(chicago))
head(chicago)
head(chicago[, -(i:j)])

#Filter
chic.f <- filter(chicago, pm25tmean2 > 30)
head(chic.f)
chic.f <- filter(chicago, pm25tmean2 > 30 & tmpd > 80)
head(chic.f)

#Arrange
chicago <- arrange(chicago, date)
head(chicago)
tail(chicago)
chicago <- arrange(chicago, desc(date))

#Rename
chicago <- rename(chicago, pm25 = pm25tmean2, dewpoint = dptp)
head(chicago)

#Mutate
chiacgo <- mutate(chicago, pm25detrend = pm25-mean(pm25, na.rm = TRUE))
head(select(chiacgo, pm25, pm25detrend))

#Group by
chicago <- mutate(chicago, tempcat = factor(1 * (tmpd > 80), labels = c("cold", "hot")))
hotcold <- group_by(chicago, tempcat)
hotcold

#Summarize
summarise(hotcold, pm25 = mean(pm25, na.rm = TRUE), o3 = max(o3tmean2), no2 = median(no2tmean2))
