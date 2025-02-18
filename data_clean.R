#Data Cleaning in R

#Data Handling and Data cleaning in R

library(wooldridge)

data=attend
head(data)

?attend
View(data)

dim(data)
summary(data)
str(data)
colnames(data)
rownames(data)


##Changing names of columns
colnames(data)
colnames(data)[4]
colnames(data)[4]="score"
colnames(data)
colnames(data)[10]
colnames(data)[10]="missed_class"
colnames(data)
##End

##Cleaning the Dataframe
x=c(0,NA,2,3,4,-0.5,0.2)
x
str(x)
class(x)
mean(x)
sd(x)
is.na(x)

x>2 #compares each element of vector x with 2

x>2 & !is.na(x) #compares all elements but ignores the NA value

#----Detour:Let's also check '|' (or) operator----#
(x==0 | x==2)
(x==0 | x==2) & !is.na(x)
#----End of Detour----#

head(data)
is.na(data) #detects NA in each cell for the dataset
sum(is.na(data)) #sums all NAs

na_rows = which(!complete.cases(data)) #Identifies rows with NA
print(na_rows) #prints row numbers

data1=data
data1[is.na(data)]=0 #setting NAs to 0
sum(is.na(data1))
data1$hwrte
mean(data1$hwrte)
mean(data$hwrte)

##Handling observations
df=data.frame(roll_no=c(NA,1,2),score=c("One",NA,"Three"))
df              
subset(df,!is.na(roll_no)) #removes roll_no's rows which contain "NA"
subset(df,!is.na(score)) #removes score's rows which contain "NA"
subset(df,complete.cases(df))

subset(data,complete.cases(data)) #remove all NA from data set and 
data2=subset(data,complete.cases(data)) #store NA less subset into variable data2
data2
sum(is.na(data2))
mean(data2$hwrte)
mean(data1$hwrte)

data3=na.omit(data) #simplest function to get rid of all NA
sum(is.na(data3))

##Working without NAs
library(car)
?Freedman
data=Freedman
View(data)
head(data)
str(data)
summary(data)

mean(data$nonwhite)
mean(data$density)
mean(data$population)

mean(data$population,na.rm=T) #removes the NA row
mean(data$density,na.rm=T) #removes the NA row

data2=na.omit(data)
summary(data2) #Problem here is that the command removes all NA rows

###Checking the NA rows
data_NA_rows=data[!complete.cases(data),]
data_NA_rows
head(data_NA_rows)

## Dealing with outliers
library(UsingR)
?babies
dim(babies)

data=babies
summary(data)
head(data)

library(dplyr)

data=data %>% mutate(dwt_kg=ceiling(dwt/2.2046)) #Adds a new column 

baby_dad_wt=data$dwt_kg
baby_dad_wt
summary(baby_dad_wt)

baby_dad_wt[baby_dad_wt == 454] = NA
summary(baby_dad_wt)
range(baby_dad_wt)
range(baby_dad_wt,na.rm=T)


## Selection of columns and rows in R
data=iris
?iris
head(data)
View()
data[2] #Prints second column
data[2,] #Prints second row
data[,2] #Prints the content of second colum
data[2,2] #Prints content of cell 2,2
data[2,3] #Prints content of cell 2,3
data[,c(3,5)] #Prints all rows for columns 3 AND 5
data[c(2,5),] #Prints all columns for rows 2 AND 5
data[c(2:5),] #Prints all columns for rows 2 to 5
data[c(2:5),c(2:4)] #Prints all columns for rows 2 to 5 and columns from 2 to 4

## Creation of new variable
data=iris
head(data)
data$petal.ratio=data$Petal.Length/data$Petal.Width
head(data)


## Extracting Observations
data=iris
###Task: Extract observations where petal width >0.5 and species ==setosa

data[data$Petal.Width>0.5 & data$Species=="setosa",]

library(dplyr)
data %>% filter(Petal.Width>0.5 & Species=="setosa")

#Summarizing the observations
summary(iris)
brief(iris)

summarize(iris,Petal.Length.mean=mean(Petal.Length),Sepal.Length.mean=mean(Sepal.Length))

iris %>% summarize(Petal.Length.mean = mean(Petal.Length), Sepal.Length.mean=mean(Sepal.Length)) 

#How to visualize data
libray(car)

data=Davis
?Davis
dim(data)
head(data)

plot(x=data$weight,y=data$height)
plot(x=data$weight,y=data$height,pch=3,col='red',xlab="Weight",ylab="Height",main="Scatterplot: Weight vs Height")
?plot

library(ggplot2)
ggplot(data,aes(x=weight,y=height))+geom_point(col="cornflower blue")+ggtitle("Scatterplot:Weight vs Height")
