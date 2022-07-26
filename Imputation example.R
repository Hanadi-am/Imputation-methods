library(dplyr)
library(ggplot2)
library(randomForest)
data("iris")
iris.na <- iris
set.seed(111)
# artificially drop some data values
for (i in 1:4) iris.na[sample(150, 20, 1), i] <- NA
iris.na
set.seed(222)
iris.imputed <- rfImpute(Species ~ ., iris.na)
set.seed(333)
iris.rf <- randomForest(Species ~ ., iris.imputed)
print(iris.rf)
print(iris.imputed)
