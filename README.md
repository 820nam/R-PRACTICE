**PRACTICE.R**

1. 기본 연산 및 통계
+, ^, log(), sum(), mean() 등 기본 수학 연산과 요약 함수 지원.

2. ggplot2 시각화
산점도(geom_point), 패싯(facet_wrap), 극좌표(coord_polar) 등 다양한 시각화.

3. dplyr 데이터 처리
필터(filter), 정렬(arrange), 요약(summarise), 변수 생성(mutate) 등 데이터 핸들링.

4. tidyr 데이터 정리
피벗(pivot_longer), 열 분리(separate), 불필요한 열 제거(select)로 데이터 구조 최적화.

**Reference dataset**

1. mpg 데이터셋
   
   1.1 내용: 미국 환경보호국(EPA)에서 제공하는 1999-2008년 자동차 연비 데이터.
   
   1.2 변수 설명:
   
   manufacturer: 제조사 이름.
   
   displ: 배기량(리터).
   
   cty, hwy: 도시 및 고속도로 연비(MPG).
   
   class: 자동차 분류 (예: 소형, SUV 등).
   
   1.3 활용: 연비와 배기량, 자동차 클래스 간의 관계를 분석하고 시각화.

3. diamonds 데이터셋
   
   1.1 내용: 가상 다이아몬드 데이터로, 다양한 다이아몬드 특성과 가격 정보 포함.
   
   1.2 변수 설명:
   
   carat: 다이아몬드 크기.
   
   cut: 절단 품질 (Fair, Good, Ideal 등).
   
   price: 가격.
   
   1.3 활용: 다이아몬드 크기와 가격 간의 관계 분석 및 품질별 분포 시각화.

5. nycflights13 패키지
내용: 2013년 뉴욕 공항 출발 항공편 데이터.
주요 데이터셋:
flights: 항공편의 출발/도착 시간, 지연 시간, 거리, 운항사 정보.
weather: 날씨 데이터.
airports: 공항 정보.
활용:
특정 날짜, 항공편의 지연 조건 분석.
출발 공항별 항공편 분포.

6. WHO 데이터셋
내용: 세계보건기구(WHO)에서 제공하는 1980-2012년간의 국가별 건강 데이터.
변수 설명:
Country: 국가명.
Year: 연도.
new_sp_*: 연령 및 성별별 결핵 신규 환자 수.
활용: 데이터 정리(pivot 및 separate 함수) 후 성별, 연령별 질병 분포 분석.
