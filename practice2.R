
# Практика 2 --------------------------------------------------------------


# Часть 1 -----------------------------------------------------------------

# Пункт 1
matrix1 = matrix(data = 3, nrow = 3, ncol = 4)
matrix1[1, 3] = 4
matrix1[2, 1] = 1
matrix1[3, 2] = NA
matrix1[3, 4] = 1
matrix1

# Пункт 2
a = c(1, 3, 4, 9, NA)
b = c(5, 6, 7, 0, 2)
c = c(9, 10, 13, 1, 20)
matrix2c = cbind(a, b, c)
matrix2c
matrix2r = rbind(a, b, c)
matrix2r
rownames(matrix2r) = paste0("row", 1:3)
colnames(matrix2r) = paste0("col", 1:5)
matrix2r
rownames(matrix2c) = paste0("row", 1:5)
colnames(matrix2c) = paste0("col", 1:3)
matrix2c

# Пункт 3
names <- c("Jane", "Michael", "Mary", "George")
ages <- c(8, 6, 28, 45)
gender <- c(0, 1, 0, 1)
matrix3 = cbind(names, ages, gender)
matrix3
ages_sq = ages * ages
matrix3 = cbind(matrix3, ages_sq)
matrix3

# Пункт 4
info = list(names = names, ages = ages, gender = gender)
info$names[2]
info$gender
info$names
drinks = c("juice", "tea", "rum", "coffee")
info = cbind(info, list(drinks = drinks))
info$names = cbind(info$names, "John")
info$ages = cbind(info$ages, 2)
info$gender = cbind(info$gender, 1)
info


# Часть 2 Итерационный метод ----------------------------------------------

# Пункт 1
A = diag(c(4,9))
rownames(A) = paste0("eq", 1:2)
colnames(A) = paste0("x", 1:2)

# Пункт 2
eigen(x = A, symmetric = T)$values

# Пункт 3
B = diag(1, nrow = 2) - A
B

# Пункт 4
f = c(4, 2)
u = c(0.2, -0.3)

# Пункт 5
u_result = solve(A, f)
u_result

# Пункт 6
u_1 = u
for (i in 1:7) {
  #Итерация на шаге (обновление приближения)
  u_1 = B %*% u + f
  #Сходимость по сравнению с предыдущим шагом
  print(sqrt(t(u_1 - u) %*% (u_1 - u)))
  #Обновление перед следующей итерацией
  u = u_1
}

# Пункт 7
print(u_1)
print(u_1 - u_result)

# Пункт 8
a_max = max(A, f)
A = F / a_max
f = f / a_max
a_max

# Пункт 9
eigen(x = A, symmetric = T)$values
B = diag(x = 1, nrow = 2) - A
B
u_result = solve(A, f)
u_result
u_1 = u_result
u_1
for (i in 1:7){
  u_1 = B %*% u + f
  print(sqrt(t(u_1 - u) %*% (u_1 - u)))
  u = u_1
}
print(u_1)
print(u_1 - u_result)


# Часть 3 Срезы Матриц ----------------------------------------------------

param <- as.integer(readLines(con="inputs.txt"), skipNUl=T) # Чтение параметров
step = 1 # Шаг сетки
dekart_begin = -5 # Начало сетки
dekart_end = 5 # Конец сетки

# Задание сеточной поверхности
x = seq(from = dekart_begin, to = dekart_end, by = step)
y = x

surface_matrix = outer(X = x, Y = y, FUN = function(x, y) Re(exp(-1i * 0.5 * x * y)))
dimnames(surface_matrix) = list(x, y)
number_of_elements = length(surface_matrix)
number_of_rows = nrow(surface_matrix)
number_of_cols = ncol(surface_matrix)

# Если матрица квадратная, высчитываем сумму диагонали
if (number_of_rows == number_of_cols) {
  sum_diag = sum(diag(surface_matrix))
}

# Если количество строк нечетное, высчитываем сумму средней строки
if (number_of_rows %% 2 != 0) {
  sum_middle_row = sum(surface_matrix[as.integer(ceiling(number_of_rows / 2)), ])
}

# Если количество строк нечетное, высчитываем сумму средней колонки
if (number_of_rows %% 2 != 0) {
  sum_middle_col = sum(surface_matrix[as.integer(ceiling(number_of_cols / 2)), ])
}

row_sums = rowSums(surface_matrix)
col_sums = colSums(surface_matrix)
counter_rows = c(1:number_of_rows)
counter_cols = c(1:number_of_cols)
write(x = paste("Number of matrix elements:", number_of_elements), 
      file="summary3.txt", append=F)
write(x = paste("Number of rows:", number_of_rows), 
      file="summary3.txt", append=T)
write(x = paste("Number of cols:", number_of_cols), 
      file="summary3.txt", append=T)

# Если матрица квадратная, записываем в файл сумму главной диагонали
if (number_of_rows == number_of_cols) {
  write(x = paste("Sum of main diag elements:", sum_diag), 
        file="summary3.txt", append=T)
}
# Если количество строк нечетное, записываем в файл сумму средней строки
if (number_of_rows %% 2 != 0) {
  write(x = paste("Sum of middle row elements:", sum_middle_row), 
        file="summary3.txt", append=T)
}
# Если количество строк нечетное, записываем в файл сумму средней колонки
if (number_of_cols %% 2 != 0) {
  write(x = paste("Sum of middle column elements:", sum_middle_col), 
        file="summary3.txt", append=T)
}
write(x = paste(counter_rows, "row sum:", row_sums), 
      file="summary3.txt", append=T)
write(x = paste(counter_cols, "column sum:", col_sums), 
      file="summary3.txt", append=T)


# Часть 4 Машины ----------------------------------------------------------

# Взять данные с kaggle

cars_matrix <- as.matrix(cars)
number_of_rows <- nrow(cars_matrix)
#1
vect_1 <- rep(number_of_rows)
cars_speed <- cbind(vect_1, cars_matrix[ , 1])
#2
cars_dist <- cars_matrix[ , 2]
#3
alpha <- solve(t(cars_speed) %*% cars_speed) %*% t(cars_speed) %*% cars_dist
#4
if(typeof(alpha) != "vector"){
  alpha <- as.vector(alpha)
}
#5
alpha_c <- alpha[1]
alpha_x <- alpha[2]
cat("alpha_c = ", alpha_c)
cat("alpha_x = ", alpha_x)
#6
cars_speed_lm <- cars_matrix[ , 1]
#7
cars_dist_lm <- alpha_c + cars_speed_lm * alpha_x
#8
dist_residuals <- cars_dist_lm - cars_dist
#9
rez_9 <- 0 #Расчет среднего отклонения
for (i in 1:length(dist_residuals)){
  rez_9 <- rez_9 + dist_residuals[i] - mean(dist_residuals)
}
rez_9 <- rez_9 / length(dist_residuals)
#Стандартное отклонение
sd_9 <- sd(dist_residuals)
#10
print(cars_dist_lm)
#11
cat("Cреднеe отклонениe: ", rez_9)
cat("Стандартное отклонение: ", sd_9)