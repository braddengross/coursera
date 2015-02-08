#Question 1 - 53 million dollar props
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl, destfile = "community.csv", method = "curl")
comm <- read.csv("community.csv")
prop_vals <- comm$VAL
prop_vals <- prop_vals[!is.na(prop_vals)]
mil_dol_props <- prop_vals[prop_vals == 24]
head(prop_vals)

#Question 3 - 36534720
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl, destfile = "nat_gas.xlsx", method = "curl")
library(xlsx)
rowIndex <- 18:23
colIndex <- 7:15
nat_gas_data <- read.xlsx("nat_gas.xlsx", rowIndex = rowIndex, colIndex = colIndex, sheetIndex = 1, header = TRUE)  
sum(nat_gas_data$Zip*nat_gas_data$Ext,na.rm=T) 

#Question 4 - 127 
library(XML)
fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
doc <- xmlTreeParse(fileUrl, useInternalNodes = TRUE)
root_node <- xmlRoot(doc)
zip_codes <- xpathApply(root_node, "//zipcode", xmlValue)
subset_zip_codes <- zip_codes[zip_codes == "21231"]

#Question 5 - X mean(DT$pwgtp15,by=DT$SEX)
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl, destfile = "community.csv", method = "curl")
DT <- fread("community.csv")
