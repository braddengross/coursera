if(!file.exists("./data")){
  dir.create("./data")
}
fileUrl <- "https://data.baltimorecity.gov/api/views/k5ry-ef3g/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile = "./data/restaurants.csv", method="curl")
restData <- read.csv("./data/restaurants.csv")
head(restData, 3)
tail(restData, 3)
summary(restData)
str(restData)
quantile(restData$councilDistrict, na.rm = TRUE)
quantile(restData$councilDistrict, probs=c(0.5,0.75,0.9))
table(restData$zipCode, useNA = "ifany")
table(restData$councilDistrict, restData$zipCode)

#cross tables
data(UCBAdmissions)
DF = as.data.frame(UCBAdmissions)
summary(DF)
names(DF)
xt <- xtabs(Freq ~ Gender + Admit, data=DF)

#flat tables
warpbreaks$replicate <- rep(1:9, len = 54)
xt = xtabs(breaks ~., data=warpbreaks)
xt

ftable(xt)
