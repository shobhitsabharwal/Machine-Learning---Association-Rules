#Apriori

rm(list=ls())
library(arules)
#importing dataset
dataset = read.csv("Market_Basket_Optimisation.csv")


#Since dataset for Apriori rules should be in sparse matrix
dataset = read.transactions("Market_Basket_Optimisation.csv", sep = ",", rm.duplicates = TRUE)
summary(dataset)
itemFrequencyPlot(dataset, topN = 10)


###training the dataset
#calculatinig support
# let say min support for item sold 4 times a day
# total sale for week = 4*7
#support = 4*7/7500 =~.004
rules = apriori(data = dataset, parameter = list(support = .004, confidence = 0.04))

#visualizaing the result
inspect(sort(rules, by = 'lift')[1:10])

# Output:
#   lhs                          rhs                    support     confidence lift     count
# [1]  {light cream}             => {chicken}           0.004532729 0.29059829 4.843951 34   
# [2]  {chicken}                 => {light cream}       0.004532729 0.07555556 4.843951 34   
# [3]  {pasta}                   => {escalope}          0.005865885 0.37288136 4.700812 44   
# [4]  {escalope}                => {pasta}             0.005865885 0.07394958 4.700812 44   
# [5]  {shrimp}                  => {pasta}             0.005065991 0.07089552 4.506672 38   
# [6]  {pasta}                   => {shrimp}            0.005065991 0.32203390 4.506672 38   
# [7]  {eggs,ground beef}        => {herb & pepper}     0.004132782 0.20666667 4.178455 31   
# [8]  {whole wheat pasta}       => {olive oil}         0.007998933 0.27149321 4.122410 60   
# [9]  {olive oil}               => {whole wheat pasta} 0.007998933 0.12145749 4.122410 60   
# [10] {herb & pepper,spaghetti} => {ground beef}       0.006399147 0.39344262 4.004360 48 