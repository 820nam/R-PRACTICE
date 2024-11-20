## R의 기본 계산 ##
# 단순연산
3 + 4^2
# 로그함수
log(10)
# 지수함수
exp(2)
# 제곱근함수
sqrt(10)
# 숫자나열
1:30
# 합계
sum(1:50)
# 정규분포함수
rnorm(12)
# 정규분포함수의 평균, 분포의 중심
mean(rnorm(10))
# 랜덤값 생성
sample(20)
# 최대랜덤값 생성
max(sample(20))

## MPG DATASET ##
# 1999년부터 2008년까지 다양한 자동차 모델의 연비(Miles Per Gallon) 및 관련 정보
# 미국 환경보호국(EPA)
# 데이터를 사용하면 자동차의 연비와 다른 요인들 간의 관계를 분석하고 시각화 가능
# 시사점: 배기량이 많을 수록 연비가 낮음의 상관관계를 유추 가능
mpg
# manufacturer: 자동차 제조사 이름
# model: 자동차 모델 이름
# displ: 배기량 (liters)
# year: 제조 연도
# cyl: 실린더 수 (cylinders)
# trans: 변속기 유형 (transmission type)
# drv: 구동방식 (drive train: f=전륜구동, r=후륜구동, 4=4륜구동)
# cty: 도시 연비 (miles per gallon)
# hwy: 고속도로 연비 (miles per gallon)
# fl: 연료 종류 (fuel type)
# class: 자동차 클래스

## Creating a scatter ggplot ##
# Creating a scatter ggplot_basic
# mapping 함수: 특정 시각화 요소 + 데이터의 열을 매핑(연결)
# aes 함수: 데이터와 시각화 속성 매핑 시 사용
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point()
# Creating a scatter ggplot_basic_class_color
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class))
ggplot(data = mpg, aes(x = displ, y = hwy)) +  geom_point(mapping = aes(color = class))
# Creating a scatter ggplot_basic_class_color_all blue
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy), color = "blue")
# Creating a scatter ggplot_basic_class_color_size
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, size = class))
# Creating a scatter ggplot_basic_class_alpha
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, alpha = class))
# Creating a scatter ggplot_basic_class_shape
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, shape = class))
# Creating facets ggplot_categorical variable_2row_divide
# facet_wrap: 데이터를 하나 이상의 조건에 따라 여러 패널로 분류
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_wrap(~ class, nrow = 2)
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy)) + facet_wrap(~ drv + cyl)
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class)) + facet_wrap(~ drv + cyl)
# Creating facets ggplot_categorical variable_2row_divide
# facet_grid: 데이터를 두 개의 변수에 의해 정의된 조건에 따라 여러 패널로 분류
ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy, color = class)) + facet_grid(drv ~ cyl)

## Creating a geommatric object ggplot ##
# loess: 부드러운 곡선을 활용하여 데이터의 경향성 표현
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy))
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_smooth(method = "loess")
# Creating a scatter ggplot_smooth line
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point() + geom_smooth(method = "loess")
# show.legend: 데이터의 범례를 제어하는데 사용, 부드러운 곡선을 활용하여 데이터의 경향성 표현
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv))
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy, linetype = drv), show.legend = TRUE)
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy, colour = drv), show.legend = TRUE)
ggplot(data = mpg) + geom_smooth(mapping = aes(x = displ, y = hwy, colour = drv), show.legend = FALSE)
# Creating a scatter ggplot_smooth line_filter_class_subcompact
# filter() 함수를 이용하여 mpg 데이터프레임에서 class 변수가 subcompact인 것들만을 가지고 그린 smooth line 그래프
ggplot(data = mpg, mapping = aes(x = displ, y = hwy)) +   geom_point(mapping = aes(colour = class)) + 
  geom_smooth(data = filter(mpg, class == "subcompact"), se = FALSE)


## DIAMONDS DATASET ##
# 실제 연구를 위해 수집된 데이터가 아니며, 주로 데이터 시각화 및 분석을 연습하기 위한 용도로 사용
# 가상의 데이터
# 데이터를 사용하면 다이아몬드의 특성과 가격 간의 관게를 이해하고 시각화 가능
# 시사점: 다이아몬드 특성과 가격 간의 관계를 이해하고 시각화하는데 사용 가능
diamonds
view(diamonds)
# carat: 다이아몬드의 크기를 나타내는 단위인 캐럿(carat) 값.
# cut: 다이아몬드의 절단 품질을 나타내는 범주형 변수. 범주는 Fair, Good, Very Good, Premium, Ideal로 구성.
# color: 다이아몬드의 색상을 나타내는 범주형 변수. 범주는 J(최저), I, H, G, F, E, D(최고)로 구성됩니다.
# clarity: 다이아몬드의 투명도를 나타내는 범주형 변수. 범주는 I1(최저), SI2, SI1, VS2, VS1, VVS2, VVS1, IF(최고)로 구성
# price: 다이아몬드의 가격을 나타내는 숫자형 변수.
# depth: 다이아몬드의 깊이를 나타내는 변수.  depth 값이 60이면 다이아몬드의 깊이가 전체 높이의 60%를 차지를 의미

## Creating a statistical transformations
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut))
ggplot(data = diamonds) + stat_count(mapping = aes(x = cut))
ggplot(data = diamonds, mapping = aes(x = cut)) +  stat_count(geom = "bar")
ggplot(data = diamonds, mapping = aes(x = cut)) +  stat_count()
ggplot(data = diamonds, mapping = aes(x = cut, fill = cut)) +  stat_count()
# ..prop..: 빈도가 아닌 비율로 출력 가능
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, y = ..prop.., group = 1))
# Creating a statistical transformations_min, max, median
ggplot(data = diamonds) + stat_summary(mapping = aes(x = cut, y = depth),fun.ymin = min, fun.ymax = max, fun.y = median)
# 다이아몬드의 품질과 개수를 나타내는 그래프에 clarity 수준에 따라 bar에 각 빈도 값을 색상으로 채워넣는 그래프 
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity))
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity), position = "identity")
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity), alpha = 0.5, position = "identity")
# Creating a statistical_Position Dodge Argument 
ggplot(data = diamonds) + geom_bar(mapping = aes(x = cut, fill = clarity), position = "dodge")
# Coordinate systems_box plot
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + geom_boxplot() + coord_flip()
ggplot(data = mpg, mapping = aes(x = class, y = hwy)) + geom_boxplot()
# Coordinate systems_Coxcomb chart_극좌표
ggplot(data = diamonds, mapping = aes(x = cut, fill = cut)) + 
  geom_bar(width = 1, show.legend = FALSE) + theme(aspect.ratio = 1) + labs(x = NULL, y = NULL) +  coord_polar()
# Coordinate systems_bar chart_극좌표
ggplot(data = diamonds, mapping = aes(x = cut, fill = cut)) + 
  geom_bar(width = 1, show.legend = FALSE) + theme(aspect.ratio = 1) + labs(x = NULL, y = NULL)


## NYFLIGHT13 PACKAGE ##
library(dplyr)
library(nycflights13)
# flights: 2013년 뉴욕시 항공편 데이터
# weather: 2013년 뉴욕시 공항 날씨 데이터
# airports: 항공편이 이륙 및 착륙한 공항에 대한 정보
# airlines: 항공사에 대한 정보
# planes: 항공기에 대한 정보
# routes: 항공노선에 대한 정보

## FLIGHTS DATASET ##
# 2013년에 뉴욕에서 이륙한 모든 항공편에 대한 데이터가 포함
# TIBBLE DATA FRAME
flights
view(flights)
# year: 항공편의 출발 연도 (모든 값은 2013으로 설정됩니다).
# month: 항공편의 출발 월 (1부터 12까지의 정수).
# day: 항공편의 출발 일 (1부터 31까지의 정수).
# dep_time: 실제 출발 시각 (형식: HHMM, 24시간 형식).
# sched_dep_time: 예정 출발 시각 (형식: HHMM, 24시간 형식).
# dep_delay: 출발 지연 시간 (분).
# arr_time: 실제 도착 시각 (형식: HHMM, 24시간 형식).
# sched_arr_time: 예정 도착 시각 (형식: HHMM, 24시간 형식).
# arr_delay: 도착 지연 시간 (분).
# carrier: 항공사 코드.
# flight: 항공 편 번호.
# tailnum: 항공기의 꼬리 번호.
# origin: 출발지 공항 코드.
# dest: 도착지 공항 코드.
# air_time: 비행 시간 (분).
# distance: 비행 거리 (마일).
# hour: 출발 시간의 시간 부분.
# minute: 출발 시간의 분 부분.
# time_hour: 출발 시간과 날짜 (YYYY-MM-DD HH:MM:SS 형식)를 결합한 변수.

# filter 함수
# filter 함수를 사용하여 1월 1일의 모든 항공편을 선택
filter(flights, month == 1, day == 1)
# dplyr 패키지는 작업 결과로 데이터 프레임이 수정되지 않으므로 결과를 저장하려면 할당 연산자 '<-'를 사용
gilnam <- filter(flights, month == 1, day == 1)
# R은 결과를 출력하거나 변수에 저장하므로, 둘 다 수행하려면 괄호로 감싸면 된다.
(dec25 <- filter(flights, month == 12, day == 25))

# 비교 연산자의 문제점
# == 를 사용하면 발생하는 문제. 컴퓨터는 유한한 정밀도 산술을 사용하므로 모든 숫자는 근사치임을 기억.
# == 에 의존하는 대신 Near()를 사용.
sqrt(2) ^ 2 == 2
1 / 49 * 49 ==1
# NEAR 함수 
near(sqrt(2) ^ 2 , 2)
near(1 / 49 * 49, 1)
# 논리 연산자
filter(flights, month == 11 | month == 12)
# 이항 연산자 %in%: 데이터 필터링에 유용하게 사용
nov_dec <- filter(flights, month %in% c(11, 12))
# 도착 또는 출발 시 2시간 이상 지연되지 않은 항공편을 찾는 코드
filter(flights, !(arr_delay > 120 | dep_delay > 120))
filter(flights, arr_delay <= 120, dep_delay <= 120)
# ARRANGE 함수를 활용하여 행 정렬
# DESC 함수: 내림차순으로 정렬하는 함수
flights_sorted <- arrange(flights, desc(year), desc(month), desc(day))
# SELECT 함수: 실제로 관심있는 변수로 좁히는 함수
select(flights, year, month, day)
# CONTAINS 함수: 포함하는 단어를 찾는 함수
select(flights, contains("dep"))
# year부터 day 열까지, 그리고 이름이 "delay"로 끝나는 열들과 distance, air_time 열을 선택하여 flights_sml 데이터프레임
flights_sml <- select(flights, year:day, ends_with("delay"), distance, air_time)
# MUTATE 함수: 데이터 세트의 끝에 새 열을 추가하는 함수
# GAIN 변수: 출발부터 도착까지 시간 측정하는 변수. 값이 음수라면 비행기가 예상보다 더 늦게 도착했음을 의미하는 변수
# SPEED 변수: 평균 속도는 비행 거리를 비행 시간으로 나눈 것을 의미하는 변수
mutate(flights_sml, gain = dep_delay - arr_delay, speed = distance / air_time * 60)
# HOURS 변수: 비행시간을 분 단위로 나타낸 후 시간 단위로 변환한 값을 나타내는 변수
# GAIN_PER_HOURS 변수: 비행기가 시간단위로 얼마나 많은 지연을 갖는지를 나타내는 변수
mutate(flights_sml, gain = dep_delay - arr_delay, hours = air_time / 60, gain_per_hour = gain / hours)
# TRANSMUTE 함수: 기존 데이터를 남겨두지 않은 채 새로운 변수만으로 추가하여 새로운 변수를 만드는 함수
# 아래 두 코드를 비교하면 TRANSMUTE 함수의  기능을 이해 가능
flights_gml <- transmute(flights, gain = dep_delay - arr_delay, hours = air_time / 60, gain_per_hour = gain / hours)
flights_gml <- mutate(flights, gain = dep_delay - arr_delay, hours = air_time / 60, gain_per_hour = gain / hours)
# SUMMARISE 함수: 그룹화된 요약
summarise(flights, delay = mean(dep_delay, na.rm = TRUE))


## WHO DATASET ##
# World Health Organization
# 세계 각국의 전염병 및 보건 관련 데이터를 포함
# 전 세계적인 전염병 추이와 보건 지표에 관한 정보를 담고 있어 다양한 보건 및 역학 연구에 활용
library(readr)
who
view(who)
who <- read.csv("C:/Users/이길남/Desktop/DATASET/[2024.04.19] 1980-2012Y WHO DATASET.csv")
# Country: 국가 이름을 나타냅니다.
# Year: 데이터가 기록된 연도를 나타냅니다.
# new_sp_m014: 새로운 남성 성인 중 0-14세 사이의 세균성 폐결핵 환자 수를 의미
# new_sp_m1524: 새로운 남성 성인 중 15-24세 사이의 세균성 폐결핵 환자 수를 의미
# new_sp_m2534: 새로운 남성 성인 중 25-34세 사이의 세균성 폐결핵 환자 수를 의미
# new_sp_m3544: 새로운 남성 성인 중 35-44세 사이의 세균성 폐결핵 환자 수를 의미
# new_sp_m4554: 새로운 남성 성인 중 45-54세 사이의 세균성 폐결핵 환자 수를 의미
# new_sp_m5564: 새로운 남성 성인 중 55-64세 사이의 세균성 폐결핵 환자 수를 의미
# new_sp_m65: 새로운 변수는 65세 이상인 남성 성인의 세균성 폐결핵 환자 수를 의미
# new_sp_f014: 새로운 변수는 여성 성인 중 0-14세 사이의 세균성 폐결핵 환자 수를 의미
# new_sp_f1524: 새로운 변수는 여성 성인 중 15-24세 사이의 세균성 폐결핵 환자 수를 의미
# new_sp_f2534: 새로운 변수는 여성 성인 중 25-34세 사이의 세균성 폐결핵 환자 수를 의미
# new_sp_f3544: 새로운 변수는 여성 성인 중 35-44세 사이의 세균성 폐결핵 환자 수를 의미
# new_sp_f4554: 새로운 변수는 여성 성인 중 45-54세 사이의 세균성 폐결핵 환자 수를 의미
# new_sp_f5564: 새로운 세균성 폐결핵 환자 수(female, age 55-64 years)

# 데이터셋 구조 확인
str(who)
# 변수와 관측치 확인
# a.	Figure out what the variables and observations are?
dim(who)
# 데이터 일부 확인
# b.	Are there redundant variables? If yes, what are they? 
head(who)
# "who" 데이터셋을 사용하여 "new_sp_m014"부터 "new_rel_f65"까지의 열을 피벗하여 "key"라는 새 변수에
# 열 이름을, "cases"라는 새 변수에 해당 값을 저장하고, 누락된 값이 있는 행을 삭제하여 결과를 "who1"에 저장
library(tidyr)
who1 <- who %>%
  pivot_longer(cols = new_sp_m014:new_rel_f65, names_to = "key", values_to = "cases", values_drop_na = TRUE)
who1
# COUNT 함수: 각 변수가 언급되는 빈도수를 계산
who1 %>% count(key)
# SEPARATE 함수: 열을 분리하는 함수
who2 <- who1 %>% separate(key, c("new", "type", "sexage"), sep = "_")
# INTO 매개변수: 분리된 열의 이름을 지정
who3 <- who2 %>% separate(sexage, into = c("sex", "age"), sep = 1)
# 분리된 열의 이름을 직접 지정
who3 <- who2 %>% separate(sexage, c("sex", "age"), sep = 1)
# 5.	Write a code to drop “iso2”, “iso3”, and “new” columns. Please show me that you have tidy data now
who4 <- who3 %>% select(-iso2, -iso3, -new)


# library(tidyverse)
# library(readr)
# library(tidyr)

# 1. Import “who” dataset and explore it  
who <- read.csv("C:/Users/이길남/Desktop/DATASET/[2024.04.19] 1980-2012Y WHO DATASET.csv")
str(who)
#   a. Figure out what the variables and observations are.
dim(who)
#   b. Are there redundant variables? If yes, what are they? 
head(who)

# 2. All the columns from new_sp_m014 to new_rel_f65 are likely to be values, not variables.
# That is, the problem of “who” data is that one variable is spread across multiple columns. 
#   a .Write a code to pivot the offending columns into a new variable, and make the data as shown in the following table. 
#   Then, save the pivoted data as “who1” [hint: drop missing values using “
#   values_drop_na=TRUE” argument in the pivot function]  
who1 <- who %>%
  pivot_longer(cols = new_sp_m014:new_rel_f65, names_to = "key", values_to = "case", values_drop_na = TRUE )
who1
# 3. Write a code to separate the variable “key” into “new”, “type”, sexage” columns as shown in the following table 
who2 <- who1 %>% separate(key, c("new", "type", "sexage"), sep = "_")
# 4. Write a code to separate the variable “sexage” into “sex” and “age” columns
who3 <- who2 %>% separate(sexage, into = c("sex", "age"), sep = 1)
# Write a code to drop “iso2”, “iso3”, and “new” columns. Please show me that you have tidy data now
who4 <- who3 %>% select(-iso2, -iso3, -new)


reading <- read.csv("C:/Users/이길남/Desktop/DATASET/[2024.04.19] 2002-2021Y 종이책전자책 성인 독서량.csv")
reading2 <- select(reading, SC2, 시점, '독서자.평균')
result <- reading %>%
  filter(SC2 == "남성") %>%
  mutate(Gender = "남성") %>%
  select(Gender, 시점, '독서자.평균')
# 시점(시간) 열을 반올림하여 새로운 변수를 만듭니다.
result$rounded_time <- round(result$시점, digits = 1)
# ggplot을 사용하여 반올림된 시점을 이용하여 그래프를 그립니다.
ggplot(data = result) +
  geom_bar(mapping = aes(x = rounded_time, y = `독서자.평균`), stat = "identity")

reading <- read.csv("C:/Users/이길남/Desktop/DATASET/[2024.04.19] 2002-2023Y 13세 이상 인구 독서량.csv")
reading1 <- reading %>%
  pivot_longer(cols = X2009:X2023, names_to = "key", values_to = "cases", values_drop_na = TRUE)


selected_rows <- filter(reading1, 특성별.1. == "전체")


ggplot(data = selected_rows) +
  geom_point(mapping = aes(y = 'cases'), stat = "identity")

## RESHAPE2 PAKAGE ##
# 데이터 구조를 변환하는 패키지
install.packages("reshape2")
library('reshape2')
ID = c(1, 2, 3, 4, 5)
SEX = c('M', 'M', 'F', 'F', 'F')
ENG = c(65, 55, 45, 95, 78)
MATH = c(89, 88, 87, 46, 65)
CHEMISTRY = c(75, 58, 58, 96, 32)
PHYSICS = c(58, 70, 100, 99, 87)
df = data.frame(ID, SEX, ENG, MATH, CHEMISTRY, PHYSICS)
df_melt = melt(df, id.vars = c('ID', 'SEX'))
boxplot(value~variable, df_melt)