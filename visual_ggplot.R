
# Visualization using the ggplot2 package

library(ggplot2)
### Petrol Price trend in Chennai
data= read.csv(file="D:/RWorks/Financial_analytics/Data/petrol.csv")
head(data)
View(data)

summary(data)
sum(is.na(data))
str(data)
data$date=as.Date(data$date)
str(data)

### Filtering data for TN only
library(dplyr)
head(data %>% filter(state=="Tamil Nadu"))
head(data %>% filter(state=="Tamil Nadu") %>% select(date,rate))

data_TN=data %>% filter(state=="Tamil Nadu") %>% select(date,rate)
head(data_TN)

### Plotting the data 
ggplot(data=data_TN,aes(x=date,y=rate))+geom_point(col='dark green',size=2)+ggtitle("Scatterplot: Petrol Prices in Chennai from 2002 to 2022")
ggplot(data=data_TN,aes(x=date,y=rate))+geom_line(col='cornflower blue',size=2)+ggtitle("Scatterplot: Petrol Prices in Chennai from 2002 to 2022")

## Visualization using bar plots

### Visualization of Economic indicators
data= read.csv(file="D:/RWorks/Financial_analytics/Data/economic_data.csv")
head(data)
summary(data)
str(data)

#### We notice that Moody's Ratings and Economic outlooks have been marked as "characters". However, these are factors

data$Moodys_Rating=as.factor(data$Moodys_Rating) #coverts into factor
levels(data$Moodys_Rating)

data$Economic_Outlook=as.factor(data$Economic_Outlook)
levels(data$Economic_Outlook)

table(data$Economic_Outlook) #Returns the count of each level

ggplot(data=data,aes(x=Economic_Outlook))+geom_bar()

ggplot(data=data,aes(x=Economic_Outlook,fill=Economic_Outlook))+geom_bar()

ggplot(data=data,aes(x=Economic_Outlook,fill=Economic_Outlook))+geom_bar()

ggplot(data=data,aes(x=Economic_Outlook,fill=Economic_Outlook))+geom_bar()+coord_polar(theta = "y") + theme_void() + labs(title = "Economic outlook of countries in a Pie Chart ") +scale_fill_brewer(palette = "Set2")


#Plotting Per Capita GDP vs Trade Deficit
ggplot(data=data,aes(x=Trade_Deficit,y=Per_Capita_GDP))+geom_point()
ggplot(data=data,aes(x=Trade_Deficit,y=Per_Capita_GDP))+geom_point(size=3,shape=15)

ggplot(data=data,aes(x=Trade_Deficit,y=Per_Capita_GDP,colour=Country))+geom_point(size=3,shape=15)

library(dplyr)

data %>% filter(Country=="India" | Country=="United States" | Country=="Australia" | Country=="China" | Country=="Germany" | Country=="Japan" | Country == "Pakistan")

data2=data %>% filter(Country=="India" | Country=="United States" | Country=="Australia" | Country=="China" | Country=="Germany" | Country=="Japan" | Country == "Pakistan")

ggplot(data2,aes(x=Trade_Deficit,y=Per_Capita_GDP,colour=Country))+geom_point(size=3,shape=15)


ggplot(data=data,aes(Moodys_Rating))+geom_bar()
       
ggplot(data=data,aes(x=Trade_Deficit))+geom_histogram(fill='salmon',col="dark blue")+ggtitle("Histogram of Trade Deficit Distribution for 50 countries")+xlab("Trade Deficit in billion $")+ ylab("Frequency")


       