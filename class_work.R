
# Итерационный метод ------------------------------------------------------

A = diag(c(4,9))
rownames(A) = paste0("eq", 1:2)
colnames(A) = paste0("x", 1:2)

# Собственные значения матрицы A
eigen(x = A, symmetric = T)$values

# B
B = diag(1, nrow = 2) - A
B

# f and u
f = c(4, 2)
u = c(0.2, -0.3)

# SOLVE SLE
u_result = solve(A, f)
print(u_result)

# Max A
a_max = max(A, f)
A = F / a_max
f = f / a_max

# Итерационный метод
B = diag(1, nrow = 2) - A
u_1 = u
for (i in 0:7) {
  #Итерация на шаге (обновление приближения)
  u_1 = B %*% u + f
  #Сходимость по сравнению с предыдущим шагом
  print(sqrt(t(u_1 - u) %*% (u_1 - u)))
  #Обновление перед следующей итерацией
  u = u_1
}
print(u_1)
print(u_1 - u_result)


# Срезы матриц ------------------------------------------------------------

step = 1 #Шаг сетки
dekart_begin = -5 #Начало сетки
dekart_end = 5 # Конец сетки

# Задание сеточной поверхности
x = seq(from = dekart_begin, to = dekart_end, by = step)
y = x

surface_matrix = outer(X = x, Y = y, FUN = function(x, y) Re(exp(-1i * 0.5 * x * y)))
dimnames(surface_matrix) = list(x, y)

surface_matrix
length(surface_matrix)
sum(diag(surface_matrix))


# Запись в файл -----------------------------------------------------------


test = c("value1" = 5, "value" = 3, "value3" = 7)
test
write(x = test, file = "data.txt", ncolumns = 1)

# pipe
# tools -> install package -> magrittr
library(magrittr)
x %>% print()
x %>% 
  sub(pattern = ",", replacement = ".") %>% 
  gsub(pattern = ",", replacement = ".") %>% 
  as.double() %>% 
  print()

      
      
      