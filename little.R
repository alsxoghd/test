install.packages(c("ggplot2", "plyr", "reshape"))

install.packages("dplyr")
library(ggplot2)
library(reshape)
library(plyr)
library(dplyr)

install.packages("QuantPsyc")

install.packages("boot")


#------And then load these packages, along with the boot package.-----
library(QuantPsyc)
library(car)
library(boot)



festivalData <- read.delim("DownloadFestival.dat.txt",  header = TRUE)

a<-read.delim("KCYPS2018m1Yw1.dat", header=TRUE)

aa<-a %>%
  select(
  )

#부정적 -> 긍정적 으로 바꾸기
aaa<-KCYPS2018m1Yw1.dat %>% 
  changes()
change

aReg<-lm(YTIM1D01w1~YEDU2A01w1,data=a)
summary(aReg)

aReg2<-lm(YTIM1D01w1~YEDU2A01w1+YEDU2A02w1,data=a)
summary(aReg2)

vif(aReg2)

#잔차확인 = durbinWatson

install.packages("car")
library("car")

resid(aReg)
rstandard(aReg)
durbinWatsonTest(aReg)

#THIS로 시작

a<-read.delim("THIS.txt", header=TRUE)

flights_df %>%
  mutate(mean_distance=distance/hour, 
         ratio_delay=arr_delay/(hour*60+minute))
a%>% 
  mutate(mean_friend=(YEDU2A01w1+YEDU2A02w1+YEDU2A03w1+YEDU2A04w1+YEDU2A05w1+YEDU2A06w1+YEDU2A07w1+YEDU2A08w1+YEDU2A09w1+YEDU2A10w1+YEDU2A11w1+YEDU2A12w1+YEDU2A13w1)/13)

aa<-
  a %>% 
  mutate(mean_friend=(YEDU2A01w1+YEDU2A02w1+YEDU2A03w1+YEDU2A04w1+YEDU2A05w1+YEDU2A06w1+YEDU2A07w1+YEDU2A08w1+YEDU2A09w1+YEDU2A10w1+YEDU2A11w1+YEDU2A12w1+YEDU2A13w1)/13)

aaReg<-lm(mean_friend~YTIM1D01w1+YTIM1D02w1+YTIM1I01w1+YTIM1I02w1+YTIM1J01w1+YTIM1J02w1+YTIM1K01w1+YTIM1K02w1,data=aa)
summary(aaReg)

#검정
#다중공선성
install.packages("car")
library(car)

vif(aaReg)

## 극단치(outlier) 확인
cooks.distance(aaReg)


## 잔차간의 자기상관 검증


durbinWatsonTest(aaReg)
dwt(aaReg)



##독립변수 추가버전 = THIS2


b<-read.delim("THIS2.txt", header=TRUE)


bb<-
  b %>% 
  mutate(mean_friend=(YEDU2A01w1+YEDU2A02w1+YEDU2A03w1+YEDU2A04w1+YEDU2A05w1+YEDU2A06w1+YEDU2A07w1+YEDU2A08w1+YEDU2A09w1+YEDU2A10w1+YEDU2A11w1+YEDU2A12w1+YEDU2A13w1)/13)

bbReg<-lm(mean_friend~YTIM1D01w1+YTIM1D02w1+YTIM1E01w1+YTIM1E02w1+YTIM1F01w1+YTIM1F02w1+YTIM1G01w1+YTIM1G02w1+YTIM1H01w1+YTIM1H02w1+YTIM1I01w1+YTIM1I02w1+YTIM1J01w1+YTIM1J02w1+YTIM1K01w1+YTIM1K02w1+YTIM1L01w1+YTIM1L02w1+YTIM1M01w1+YTIM1M02w1+YTIM1N01w1+YTIM1N02w1,data=bb)
summary(bbReg)

#검정 3시리즈

vif(bbReg)
cooks.distance(bbReg)
dwt(aaReg)
