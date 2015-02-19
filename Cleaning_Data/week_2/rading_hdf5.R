source("http://bioconductor.org/biocLite.R")
biocLite("rhdf5")
library(rhdf5)
create = h5createFile("example.h5")
create
create = h5createGroup("example.h5","foo")
create = h5createGroup("example.h5","baa")
create = h5createGroup("example.h5","foo/foobaa")
h5ls("example.h5")

#Write to file
A = matrix(1:10, nr=5, nc = 2)
h5write(A, "example.h5","foo/A")
B = array(seq(0.1,2.0,by=0.1),dim=c(5,2,2))
attr(B, "scale") <- "liter"
h5write(B, "example.h5","foo/foobaa/B")
h5ls("example.h5")

#Write a dataset
df = data.frame(1L:5L,seq(0,1,length.out=5),
                c("ab","cde","fghi", "a","s"), stringsAsFactors=FALSE)
h5write(df, "example.h5", "df")
h5ls("example.h5")

#Reading data
readA = h5read("example.h5", "foo/A")
readB = h5read("example.h5", "foo/foobaa/B")
readdf = h5read("example.h5", "df")
readdf

#Writing and reading chunks
h5write(c(12,13,14),"example.h5","foo/A",index=list(1:3, 1))
h5read("example.h5", "foo/A")
