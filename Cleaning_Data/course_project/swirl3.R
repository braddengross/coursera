library(tidyr)

students
gather(students, sex, count, -grade)

students2

res <- gather(students2, sex_class, count, -grade)
res
?separate
separate(data = res, col = sex_class, into = c("sex", "class"))


students3

?spread
