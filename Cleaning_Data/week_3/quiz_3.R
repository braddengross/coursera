#Question 1 - 125, 238,262
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv", destfile = "comm.csv", method="curl")
commData <- read.csv("comm.csv")
agricultureLogical <- commData[which(commData$ACR == 3 & commData$AGS == 6),]
head(agricultureLogical)

#Question 2 - -15259150 -10575416
install.packages("jpeg")
library(jpeg)
img <- readJPEG("getdata-jeff.jpg", native=TRUE)
quantile(img, probs = c(.3,.8))

#Question 3 - 189 matches, 13th country is St. Kitts and Nevis
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv", destfile="gdp.csv", method="curl")
gdpData <- read.csv("gdp.csv", na.strings = c("", "NA"))
gdpData <- gdpData[!is.na(gdpData$X),]
gdpData <- gdpData[!is.na(gdpData$Gross.domestic.product.2012),]
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv", destfile="edu.csv", method="curl")
eduData <- read.csv("edu.csv")
eduData <- eduData[!is.na(eduData$CountryCode),]

gdpData$Gross.domestic.product.2012 <- as.numeric(as.character(gdpData$Gross.domestic.product.2012))

gdpEdu <- merge(gdpData, eduData, by.x="X", by.y="CountryCode")
install.packages("dplyr")
library(dplyr)
gdpEduArranged <- arrange(gdpEdu, desc(Gross.domestic.product.2012))

#Question 4 - 33.72973, 32.96667 //Didn't work out in the code and it's wrong, second try: 32.96667, 91.91304
gdpEdu$Income.Group <- as.character(gdpEdu$Income.Group)
highIncomeOECD <- gdpEdu[which(gdpEdu$Income.Group == "High income: OECD"),]
highIncomeOECD <- highIncomeOECD$Gross.domestic.product.2012
highIncomeOECD <- as.numeric(highIncomeOECD)
mean(highIncomeOECD)

highIncomeNonOECD <- gdpEdu[which(gdpEdu$Income.Group == "High income: nonOECD"),]
highIncomeNonOECD <- highIncomeNonOECD$Gross.domestic.product.2012
highIncomeNonOECD <- as.numeric(highIncomeNonOECD)
mean(highIncomeNonOECD)

#Question 5 - 5 
library(Hmisc)
gdpEdu$Income.Quantile <- cut(gdpEdu$Gross.domestic.product.2012, breaks = 5)
head(gdpEdu$Income.Quantile)
table(gdpEdu$Income.Quantile, gdpEdu$Income.Group)
