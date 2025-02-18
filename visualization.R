
#Data Visualization in R

data= read.csv(file="D:/RWorks/Financial_analytics/Data/petrol.csv")
head(data)
View(data)

summary(data)

library(dplyr)

data2 = data %>% filter(state=="Tamil Nadu")
head(data2)

