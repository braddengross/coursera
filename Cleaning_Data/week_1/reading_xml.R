library(XML)
fileUrl <- "http://www.w3schools.com/xml/simple.xml"
doc <- xmlTreeParse(fileUrl, useInternalNodes = TRUE)
rootNode <- xmlRoot(doc)
xmlName(rootNode)
names(rootNode)
#Access xml like you would a list
rootNode[[1]]
rootNode[[1]][[1]]
#Loops the root node and runs xmlValue on all tagged elements
xmlSApply(rootNode, xmlValue)

#for better access use XPath language
#http://www.stat.berkeley.edu/~statcur/Workshop2/Presentations/XML.pdf

xpathSApply(rootNode, "//name", xmlValue)
xpathSApply(rootNode, "//price", xmlValue)

#Extracting website data
fileUrl <- "http://espn.go.com/nfl/team/_/name/bal/baltimore_ravens"
doc <- htmlTreeParse(fileUrl, useInternalNodes = TRUE)
scores <- xpathSApply(doc, "//li[@class='score']", xmlValue)
teams <- xpathSApply(doc, "//li[@class='team-name']", xmlValue)
