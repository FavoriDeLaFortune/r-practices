
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
