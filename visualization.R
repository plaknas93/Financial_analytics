
#Data Visualization in R

## Visualization using simple plots

### Petrol Price trend in Chennai
data= read.csv(file="D:/RWorks/Financial_analytics/Data/petrol.csv")
head(data)
View(data)

summary(data)
sum(is.na(data))
str(data)

### Filtering data for TN only
library(dplyr)
head(data %>% filter(state=="Tamil Nadu"))
head(data %>% filter(state=="Tamil Nadu") %>% select(date,rate))

data_TN=data %>% filter(state=="Tamil Nadu") %>% select(date,rate)
head(data_TN)


### Plotting the data 
plot(x=data_TN$date,y=data_TN$rate) ###Error why?

#### Let's check the data type of each column in our dataset
str(data_TN)

#### Here face error because the data type for "date" is character
#### We know that scatterplot can plot only two NUMBERS. Hence, we must change the nature of the "date" column from character to number. In this case, we'll change into date)
data_TN$date=as.Date(data_TN$date)

#Scatterplot
plot(x=data_TN$date,y=data_TN$rate)

plot(data_TN,type='l',col='cornflower blue',lwd=4,main="Time-series: Chennai Forthnightly Petrol Price Trend 2002 to 2020") #Aestically                            

## Visualization using bar plots

### Visualization of Economic indicators
data= read.csv(file="D:/RWorks/Financial_analytics/Data/economic_data.csv")
head(data)
View(data)
summary(data)
str(data)
colnames(data)

#### We notice that Moody's Ratings and Economic outlooks have been marked as "characters". However, these are factors

data$Moodys_Rating=as.factor(data$Moodys_Rating) #coverts into factor
levels(data$Moodys_Rating)

data$Economic_Outlook=as.factor(data$Economic_Outlook)
levels(data$Economic_Outlook)

table(data$Economic_Outlook) #Returns the count of each level

barplot(table(data$Economic_Outlook),main="Barplot")
pie(table(data$Economic_Outlook),main="Piechart")

barplot(table(data$Economic_Outlook),main="Barplot",horiz = T)
barplot(table(data$Economic_Outlook),main="Barplot: 50 Countries Economic Outlook",col=rainbow(3),border="dark green",ylab="Frequency",xlab="Economic Outlook")

plot(data$Trade_Deficit,data$Per_Capita_GDP)
cor(data$Trade_Deficit,data$Per_Capita_GDP)

#Plotting trade deficit against GDP per capita
library(ggplot2)
ggplot(data=data,aes(x=Trade_Deficit,y=Per_Capita_GDP))+geom_point(size=3,shape=17,col='#fa2205')

ggplot(data=data,aes(x=data$Trade_Deficit,y=data$Per_Capita_GDP,colour =Country))+geom_point(size=3,shape=17)

### We notice here that R is not able to recognize each data point as a seprate country. This is because we did NOT specify each data point as a seprate country

data2 = data %>% filter(Country=="India" | Country=="United States" | Country=="China" | Country=="Pakistan")
data2
head(data2)

ggplot(data=data2,aes(x=Trade_Deficit,y=Per_Capita_GDP,colour = Country))+geom_point(size=2,shape=17)


