1. 기본 계산 및 연산
+, `^, `log(),exp(), sqrt() 등 기본 수학
sum(),mean() 등rnorm(),sample()로 무작

2. ggplot2 시각화
산점도: ggplot(data = mpg) + geom_point(mapping = aes(x = displ, y = hwy))
색상/크기 조정: aes(color = class, size = class) 활용.
패싯 분할: facet_wrap(~ class, nrow = 2)로 카테고리별 그래프 분리.

3. dplyr 데이터 처리
필터링: filter(flights, month == 1, day == 1)
정렬: arrange(flights, desc(dep_delay))
변수 생성: mutate(flights, gain = dep_delay - arr_delay)
요약: summarise(flights, delay = mean(dep_delay, na.rm = TRUE))

4. tidyr 데이터 정리
컬럼 피벗: pivot_longer(cols = new_sp_m014:new_rel_f65, names_to = "key", values_to = "cases")
문자열 분리: separate(key, c("new", "type", "sexage"), sep = "_")
