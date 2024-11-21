### R 기본 계산 관련 함수
3 + 4^2                     # 덧셈과 거듭제곱 연산자
log(10)                     # 자연 로그 계산 (log_e)
exp(2)                      # 지수 함수 계산 (e^2)
sqrt(10)                    # 제곱근 계산 (√10)
1:30                        # 숫자 나열 (1부터 30까지 생성)
sum(1:50)                   # 1부터 50까지 합계
rnorm(12)                   # 평균 0, 표준편차 1 정규분포 난수 생성
mean(rnorm(10))             # 정규분포 난수 10개의 평균
sample(20)                  # 1부터 20까지 무작위 섞기
max(sample(20))             # 무작위 값 중 최대값

### mpg 데이터셋 분석 및 시각화
library(ggplot2)
library(esquisse)
ggplot(data = mpg, aes(x = displ, y = hwy)) + geom_point(aes(color = class))  # 클래스별 색상
ggplot(data = mpg) + geom_point(aes(x = displ, y = hwy, size = class))  # 클래스별 크기 지정
ggplot(data = mpg) + geom_point(aes(x = displ, y = hwy, alpha = class)) # 투명도 조정
ggplot(data = mpg) + geom_point(aes(x = displ, y = hwy, shape = class)) # 모양 변경
ggplot(data = mpg) + geom_smooth(aes(x = displ, y = hwy), method = "loess") # 부드러운 곡선

### diamonds 데이터셋 시각화
ggplot(data = diamonds) + geom_bar(aes(x = cut))                       # 막대 그래프
ggplot(data = diamonds) + geom_bar(aes(x = cut, fill = clarity))       # clarity별 색상 추가
ggplot(data = diamonds) + geom_bar(aes(x = cut, fill = clarity), position = "dodge") # 막대 분리
ggplot(data = diamonds, aes(x = cut, fill = cut)) + coord_polar()      # 극좌표 그래프

### nycflights13 데이터셋 분석
library(dplyr)
library(nycflights13)                                                  # 패키지 로드
filter(flights, month == 1, day == 1)                                  # 1월 1일 데이터 필터링
arrange(flights, desc(dep_delay))                                      # 출발 지연 내림차순 정렬
select(flights, year, month, day)                                      # 연도, 월, 일 열만 선택
mutate(flights, gain = dep_delay - arr_delay)                          # 출발/도착 지연 시간 차이 추가

### WHO 데이터셋 데이터 정리
library(dplyr)
library(tidyr)
who1 <- pivot_longer(who, cols = starts_with("new_sp_"), names_to = "key", values_to = "cases") # 긴 형식으로 변환
who2 <- separate(who1, key, into = c("new", "type", "sexage"), sep = "_")                      # key 열을 분리
who3 <- separate(who2, sexage, into = c("sex", "age"), sep = 1)                                # sexage 열 분리
who_clean <- who3 %>% select(-iso2, -iso3, -new)                                              # 불필요한 열 삭제

### reshape2 패키지 활용
library(reshape2)
df_melt <- melt(df, id.vars = c("ID", "SEX")) # 데이터를 긴 형식으로 변환
boxplot(value ~ variable, data = df_melt)    # 각 변수별 박스플롯 생성
