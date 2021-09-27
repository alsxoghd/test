print("hello world")


(4+199)/2

#최수정의 클래스입니다.

#변수 만들기

a<-2 
a<-3
a
a<-c("2","3")
#코드순서는 의미없다, 실행의 순서가 의미.

# "를 쓰면 문자
a<-c("T","F")

#5가지중 2로 쓰는 2가지는 NUMERIC, CARACTER. 추가로 integer는 정수 (달)등 

#R에서 쓰이는 자료구조

#scalar, vector,matrix, array, list, dataframe, + tibble

a<-1
a
a<-"bts"

getwd()

v<-c(1,2,3)
v<-c("태홍","태윤")
#123이 횡으로 붙으면 벡터, 벡터가종으로 붙으면 matrix
#vector여러개의 원소들이나 하나의 row

m<-matrix(c(1,2,3,4,5,6),nrow=3)
m
m<-matrix(c(1,2,3,4,5,6),nrow=2)
#matrix부터 data에 들어감
#쉼표, 의미 반드시 기억
#[1,] = 1번째 row의 모든 column
[3,2]
#[,2] = 모든 row when column=2
#숫자가 종으로 들어가는게 싫다
m2<-matrix(c(1,2,3,4,5,6),nrow=2,byrow=TRUE)

m2<-matrix(c(1,2,3,4,5,6),nrow=2,byrow=FALSE)
#byrow FALSE가 기본값

m3<-matrix(1:6,nrow=2)





#벡터를 메트릭스로 쌓는 연습

mat1<-c(1:3)
mat2<-c(4:6)

matrix1<-cbind(mat1,mat2)
matrix2<-rbind(mat1,mat2)
matrix1
matrix2

matrix2[1,2]
matrix2[2,3]
matrix2[,1]
matrix2[,c(2,3)]

#array

matrix1<-matrix(c(1:9),nrow=3)
matrix2<-matrix(c(10:18),nrow=3)
matrix3<-matrix(c(19:27),nrow=3)
matrix1
matrix2
matrix3

ar<-array(c(matrix1,matrix2,matrix3),dim=c(3,3,3))
ar

#matrix단점 :원소가 같은 특성의 자료여야만함. 숫자,로지컬, 문자 등 

#dataframe
btsname<-c("RM","JIN","SUGAR","JHOPE","JIMIN","V","JK")
btsyear<-c(1994,1992,1993,1994,1995,1995,1997)

btsposition <-c("rap", "vocal", "rap", "rap", "vocal", "vocal","vocal")

bts<-data.frame(btsname,btsyear,btsposition)
#7obs = row가 7개 / 3var = 변수가 3개, column이 3개

str(bts)

#$표시 : 해당자료의 변수 지칭할때 쓰는 표시. bts데이터의 btsyear 변수를 가져와~= bts$btsyear

bts<-data.frame(btsname,btsyear,btsposition,stringsAsFactors=TRUE)
str(bts)


#factor : 값에 level이라는 정보를 추가한 것. 이때 순서는 알파벳순.


gender=factor(c("male","female","female","male"))
gender

gender=factor(c("male","female","female","male"), levels=c("male","female"))

#이분변수에서 0으로 두는 값이 중요하다. 보통 0=reference group

bts$btsposition=factor(btsposition,levels=c("vocal","rap"))
str(bts$btsposition)

bts$age<-2021-bts$btsyear+1
bts



#null, NA의 차이
#Null : 아무것도 없음 / NA:가능하지 않다, 원래 있어야하는데 데이터가 빠졌다. Missing data

bts$nullvariable<-NULL
bts$navariable<-NA

#언제차이? mean 값 계산.

bts[1,5]<-3
bts[2,5]<-5
bts[3,5]<-1
mean(bts$navariable)
mean(bts$age)
#즉 NA가 하나라도 있으면 mean값이 안나옴
mean(bts$navariable,na.rm=TRUE)
mean(bts$V5,na.rm=TRUE)
#rm=removing,제거










install.packages("dplyr")
library(dplyr)

#dplyr : 데이터 전처리에서 쓰는 패키지. 직관성이 좋고 쓰기 쉬움. 
#전처리 : 데이터를 직접수집하면 원하는 변수대로 정렬되어야함. 많은 시간 소요. 
#필터링:데이터를 횡으로 자름. 케이스를 선택 / 셀렉팅:데이터를 세로로 자름. 변수만 선택.
#ordering:정렬, mutate:새로운변수생성
#chain operator, %>%, ctrl+shift+m
#문자가 깨졌을때: file - reopen with encoding

x<-c(30,20,10,0)
sqrt(mean(abs(x)))
#이렇게 쓰면 코드가 길어짐(abs:절댓값, sqrt:제곱근, ceiling:x보다 크거나 같은 정수 )

x %>% 
  abs() %>% 
  mean() %>% 
  sqrt()

help(abs)
ceiling(3.5)
floor(3.5)
round(3.634131515,digits=3)


# 1. filter : case 선택(특정 변수의 변수값을 지닌 case들 )


install.packages("nycflights13")
library(nycflights13)

head(flights)

flights_df<-data.frame(flights)
str(flights_df)


flights_df %>% 
  filter(month==2) %>% 
  count(month)

#filter는 원자료를 건드리지 않음.

flights_df %>% 
  filter(month==2)->flight_df_filter

#이렇게 해줘야됨
#|(shift 원):or라는 뜻 / , : and라는 뜻

flights_df %>% 
  filter(month==2|day==1) %>% 
  count(month)

#! : not이라는 뜻

flights_df %>% 
  filter(month!=2)

flights_df %>% 
  filter(month>=2)

flights_df %>% 
  filter(month %in% c(5,7,10))

#NA값 제거

flights_df %>% 
  filter(is.na(month))

bts %>% 
  filter(is.na(navariable))

bts %>% 
  filter(!is.na(navariable))

#저장

flights_df %>% 
  filter(month %in% c(5,7,10))->flights_df_filter

str(flights_df_filter)

##select : 변수선택. data를 종으로 절단

select_flights_df<-flights_df %>% 
  select(month,day)
  str(select_flights_df)
  

#str는 %>% 쓰지마라, 오류생김
  
flights_df %>% 
  select(month:origin)

flights_df %>% 
  select(!month:origin)->flights_df_select
str(flights_df_select)

flights_df %>% 
  select-c(month,day)->flights_df_select
str(flights_df_select)

#arrange : 정렬. 오름차순, 내림차순 (집에서 해봐라)
##month, day 순으로 오름차순
arrange_flight_df<-
  flight_df %>%
  arrange(month, day) 

##month는 오름차순, day는 내림차순
arrange_flight_df<-
  flight_df %>%
  arrange(month, -day) 
#또는
arrange_flight_df<-
  flight_df %>%
  arrange(month, desc(day))

##month, day 순으로 내림차순
arrange_flight_df<-
  flight_df %>%
  arrange(-month, -day) 
#또는
arrange_flight_df<-
  flight_df %>%
  arrange(desc(month), desc(day))

#mutate : 파생변수=DV(기존변수로 새로운 변수 생성)등으로 새로운 변수 생성.
#(다음시간에 재설명)
#category변수 생성
#ifelse(arr_delay>0,"delay","no delay")

#숙제 : 깃허브 2번째꺼 코드들 쭉 써본다.
#다음시간 : 3.ggplot 사용, 그래프 그리기
#.dat을 working directory  안에 있어야함 (github 연결 빨리해라)
#more - go to working directory


# 9/27#
#mutate
#새로운 변수 생성

#transmute
#기존변수 삭제 후 새 변수 생성

#mutate_all
#기존의 칼럼들에 새 변수 생성 (예 모든 칼럼에 log)

#summary 
#기존것들 요약해 하나의 객체 생성

### 3.4.mutate ######################################################
##mutate는 새로운 변수를 만들어줌(파생변수(derived variables)생성)

#연산을 통해 새로운 변수 생성

flights_df %>%
  mutate(mean_distance=distance/hour, 
         ratio_delay=arr_delay/(hour*60+minute))

#ifelse를 활용하여 category변수 생성
#ifelse(조건, 조건이참일때,조건이 false일때)
flights_df %>%
  mutate(arr_delay_group=ifelse(arr_delay>0, "delay", "no delay"))


#별도 저장을 하지 않으면 명령어 실행시에만 변수가 생성됨
#별도 저장을 하는 명령어를 추가해야 함
mutate_flights_df<-
  flights_df %>%
  mutate(arr_delay_group=ifelse(arr_delay>0, "delay", "no delay"))

str(mutate_flight_df)

#별도 저장은 마지막에 써도 가능(화살표는 반대, logic을 생각하면 직관적 이해 가능)
flights_df %>%
  mutate(arr_delay_group=ifelse(arr_delay>0, "delay", "no delay"))->mutate1_flight_df


### 3.5. group_by와 summarise ######################################################
##group_by는 특정 변수로 grouping하는 것 (성별(남/여)에 따라 데이터를 split)
##summarize는 group_by와 쌍으로 자주 쓰임. 그룹별로 특정 변수의 값을 요약(평균, 분산 등)할때 사용
flights_df %>%
  group_by(month)

mutate1_flight_df %>% 
  group_by(arr_delay_group) %>% 
  summarise(max=max(arr_delay),
            min=min(arr_delay), 
            mean=mean(arr_delay), 
            med=median(arr_delay), 
            per25=quantile(arr_delay, 0,25))

table(flights_df$arr_delay)

#missing 값이 있어서 제대로 그루핑이 안되고 있음을 확인. filter를 통해 na 값을 없애고 분석해보자

flights_df %>%
  filter(!is.na(arr_delay)) %>%  #na가 아닌 row만 표시
  mutate(arr_delay_group=ifelse(arr_delay>0, "delay", "no delay")) %>% 
  group_by(arr_delay_group) %>% 
  summarise(max=max(arr_delay),
            min=min(arr_delay), 
            mean=mean(arr_delay), 
            med=median(arr_delay), 
            per20=quantile(arr_delay, 0,25))->final


str(final)
final

##summarise : 요약통계량 계산
#mean(x,na.rm=TRUE) : 결측값제외하고 평균
#median(x,na.rm=TRUE) : 중앙값
#sd(x,na.rm=TRUE) : 표준편차
#min(x,na.rm=TRUE) : 최솟값
#max(x,na.rm=TRUE) : 최대값
#IQR(x,na.rm=TRUE) : 사분위수 : Q3-Q1
#sum(x,na.rm=TRUE) : 합


#n() 카운트.관측치 개수 계산, x변수 입력 하지 않음
#n_disinct(x) : 중복없는 유일한 관측치 개수 계산
###실습######
mutate1_flight_df %>% 
  group_by(arr_delay_group) %>% 
  summarise(n=n())

mutate1_flight_df %>% 
  filter(!is.na(arr_delay)) %>% 
  group_by(arr_delay_group) %>% 
  summarise(n=n())

##rename : 변수 이름 변경
str(mutate1_flight_df)
mutate2_flight_df<- rename(mutate1_flight_df, destination=dest)

### 3.6. 마치며  ######################################################

## dplyr의 chain operator는 직관적인 사고의 흐름대로 코드를 심플하게 짤수 있다는 장점
## 단, 코드의 순서가 매우 중요함. 우리가 연산을 하는 순서가 다르면 답이 다른것처럼 먼저 작성된 코드 순서대로 
##   실행이 되기 때문에 코드를 짜기 전에 미리 데이터 소팅, 추출, 연산의 순서를 머릿속에 정리할 필요가 있음
## 또한 다른 chain operator는 다른 패키지(예: ggplot2)를 가져와서 쓸수도 있기 때문에 매우 유용함

install.packages('ggplot2')
library(ggplot2)

flights_df %>%
  filter(!is.na(arr_delay)) %>% 
  group_by(month) %>% 
  summarise(max=max(arr_delay)) %>% 
  ggplot(.,aes(x=month, y=max))+geom_line()

hello hi