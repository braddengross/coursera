#Question 1 - 2013-11-07T13:25:07Z
library(httr)
oauth_endpoints("github")
myapp <- oauth_app("github", "f4a0559a529d341e8964", "6cabb8b2ea01d6d0659266adbea7baab157070d9")
github_token <- oauth2.0_token(oauth_endpoints("github"), myapp)

gtoken <- config(token = github_token)
req <- GET("https://api.github.com/users/jtleek/repos", gtoken)
stop_for_status(req)
reqContent <- content(req, as="text")
parsedHtml <- htmlParse(reqContent, asText = TRUE)

#Question 2 - sqldf("select pwgtp1 from acs where AGEP < 50")
install.packages("sqldf")
options(sqldf.driver = "SQLite") # as per FAQ #7 force SQLite
options(gsubfn.engine = "R") # as per FAQ #5 use R code rather than tcltk
library(RMySQL)
library(sqldf)
download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv", destfile="acs.csv",method="curl")
asc <- read.csv("acs.csv")
names(asc)
sqldf("select * from asc")
sqldf("select pwgtp1 from asc where AGEP < 50")

#Question 3 (cont'd from question 2) - sqldf("select distinct AGEP from acs")
sqldf("select distinct AGEP from asc")



#Question 4 - 45 31 7 25
library(httr)
library(XML)
url <- "http://biostat.jhsph.edu/~jleek/contact.html "
con = url(url)
htmlCode = readLines(con)
close(con)
htmlCode
line10 <- nchar(htmlCode[10])
line20 <- nchar(htmlCode[20])
line30 <- nchar(htmlCode[30])
line100 <- nchar(htmlCode[100])

#Question 5 - 32426.7
data <- read.fwf(
  file=url("http://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"),
  skip=4,
  widths=c(14, 4,9, 4,9, 4,9, 4,9))
head(data, 1)
sum(data$V4)

