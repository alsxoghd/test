
1+1

245*190

a<-c("ha","kim","park","bae")
b<-c('f','m','f','m')
c<-c(1,2,3,4)
d<-data.frame(a,b,c)
d<-data.frame(name=a,gender=b,number=c)

str(d)

getwd()
setwd("C:\\R code")

install.packages("readxl")
library(readxl)
a<-read_excel("asdf.xlsx")

View(a)
str(a)
summary(d)
summary(d$name)