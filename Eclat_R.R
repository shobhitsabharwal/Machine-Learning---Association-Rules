#Eclat

rm(list=ls())
library(arules)
#importing dataset
dataset = read.csv("Market_Basket_Optimisation.csv", header = FALSE)


#Since dataset for Apriori rules should be in sparse matrix
dataset = read.transactions("Market_Basket_Optimisation.csv", sep = ",", rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)


###training the dataset
#calculatinig support
# let say min support for item sold 4 times a day
# total sale for week = 4*7
#support = 4*7/7500 =~.004
rules = eclat(data = dataset, parameter = list(support = 0.004, minlen =2))

#visualizaing the result
inspect(sort(rules)[1:10])

# Output:
# items                             support    count
# [1]  {mineral water,spaghetti}         0.05972537 448  
# [2]  {chocolate,mineral water}         0.05265965 395  
# [3]  {eggs,mineral water}              0.05092654 382  
# [4]  {milk,mineral water}              0.04799360 360  
# [5]  {ground beef,mineral water}       0.04092788 307  
# [6]  {ground beef,spaghetti}           0.03919477 294  
# [7]  {chocolate,spaghetti}             0.03919477 294  
# [8]  {eggs,spaghetti}                  0.03652846 274  
# [9]  {eggs,french fries}               0.03639515 273  
# [10] {frozen vegetables,mineral water} 0.03572857 268  