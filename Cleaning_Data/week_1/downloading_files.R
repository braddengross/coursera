setwd("~/Workspace/Coursera/Cleaning_Data/week_1")
fileUrl <- "https://data.baltimorecity.gov/api/views/dz54-2aru/rows.csv?accessType=DOWNLOAD"
download.file(fileUrl, destfile="cameras.csv", method = "curl")
date_downloaded <- date()
#cameraData <- read.table("cameras.csv", sep = ",", header = TRUE)
cameraData <- read.csv("cameras.csv")
head(cameraData)
