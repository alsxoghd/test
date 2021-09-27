a<-matrix(c(1,2,3,5),ncol=2)
View(a)
summary(a)

getwd()
library(readxl)
b<-read_excel("asdf.xlsx")
str(a)
summary(b$...2)