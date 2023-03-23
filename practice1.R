# Практика 1 --------------------------------------------------------------
  # Часть 1 -----------------------------------------------------------------
  
  #Задание 1
  
  x = 2
  y = 4
  
  temp = x
  x = y
  y = temp
  
  x
  y
  
  #Задание 2
  
  x = 3.5
  y = "2,6"
  z = 1.78
  h = TRUE
  
  typeof(x)
  typeof(y)
  typeof(z)
  typeof(h)
  
  as.integer(h)
  as.double(sub(",", ".", y))
  as.character(x)
  
  # Задание 3
  
  dohod = 1573
  dohod = log(dohod)
  dohod
  
  #Задание 4
  
  write(x = 1, file = "practice_1_example4.txt")
  n = as.numeric(readLines(con = "practice_1_example4.txt"))
  2 * n - 1
  
  
  # Часть 2 -----------------------------------------------------------------
  
  # Задание 1
  
  g = c(1, 0, 2, 3, 6, 8, 12, 15, 0, NA, NA, 9, 4, 16, 2, 0)
  g[1]
  g[length(g)]
  g[3:5]
  g[g == 2]
  g[g > 4]
  g[g %% 3 == 0]
  g[(g %% 3 == 0) & g > 4]
  g[g < 1 | g > 5]
  g[g == 0]
  which(g >= 2 & g < 8)
  sort(g[g %% 10 != 2], na.last = T)
  
  # Задание 2
  
  g = c(1, 0, 2, 3, 6, 8, 12, 15, 0, NA, NA, 9, 4, 16, 2, 0)
  g[length(g)] = NA
  g
  
  # Задание 3
  
  g = c(1, 0, 2, 3, 6, 8, 12, 15, 0, NA, NA, 9, 4, 16, 2, 0)
  which(is.na(g))
  
  # Задание 4
  
  g = c(1, 0, 2, 3, 6, 8, 12, 15, 0, NA, NA, 9, 4, 16, 2, 0)
  sum(is.na(g))
  
  # Задание 5
  
  vector_id = c(1:100)
  vector_id
  
  # Задание 6
  
  vector_country = rep(c("France", "Italy", "Spain"), c(5, 5, 5))
  vector_country
  vector_years = rep(c(2019, 2020, 2020, 2018, 2017), 3)
  vector_years
  
  # Задание 7
  
  income = c(10000, 32000, 28000, 150000, 65000, 1573)
  average = sum(income) / length(income)
  ifelse(income >= average, 1, 0)
  
  # Задание 8 (1 Вариант)
  
  x = as.integer(readLines(con = "coords"))
  p = 6.21
  write(x = sum(abs(x)*p)^(1/p), file = "result.txt")
  
  # Задание 9 (1 Вариант)
  
  x = as.integer(readLines(con = "coords"))
  det_x = c()
  for (i in 1:(length(x) - 1)) {
    det_x[i] = x[i + 1] - x[i]
  }
  det2_x = c()
  for (i in 1:(length(det_x) - 1)) {
    det2_x[i] = det_x[i + 1] - det_x[i]
  }
  write(x = det_x, file = "diff_vectors.txt")
  write(x = det2_x, file = "diff_vectors.txt", append = T)
  
  