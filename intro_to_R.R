
#Basic of R

##Check Github
### Terminal >> which git
### if not go to "https://gitforwindows.org/"
### Next install the package "library(usethis)" in R.
### Use the code: use_git_config(user.name = "Jane Doe", user.email = "jane@example.org") 
### Takes care of Project and Directory

library(usethis)
use_git_config(user.name = "Jane Doe", user.email = "jane@example.org")

##Practice operations
2+2
4+5
1+88
1-9
8/2
a=8

## R layout -> 4 Panes: Source Editor; Console; Environment; Files

###Source Editor - Type the code
###Console - Output
###Environment, History, Git
###Files, Plots, Packages, Help

###Help tab
?regression
?lm

##Creating a working Directory in R
###Definition: Folder where we work currently. Folder where R saves files
getwd()

##Packages: Collections of R functions, data, and compile code in a well-defined format. Library: The place where packages are stored in our PC.

##Basic Operators in R

### An Operator is a symbol that tells the compiler to perform a specific mathematical or logical manipulation.

#### Types of Operator: 1)Arithmetic Operators: + - / * () Require two operands
2+2
1-1
(((10+2)-2)/5)^2

a=3
a
b=9
b
a+b
a*b
a/b
b/a
a-b
b^a
4^2
4^2/2^2

log(100,10)
log(100)

#### Types of Operator: 2)Relational Operators: == > < >= <= != operations
x=9
y=5
x==y
x>y
x<=y
x!=y
5==5

a=(5==5)
a

F*50
T*50

5>2
5!=7
5>=3
3<=9
3==3 & 4>5
3==3 | 4>5

#### Types of Operator: 3)Logical Operators: & | Perform Boolean operations

T&T
T&F
F&F
T|T
T|F
F|F
T&F|F

###Summary: Learned Arithmetic, Relational & Logical Operators in R

## Data structures in R: Vectors

###Constructing Vector in R
V = c(0,9,19,15,25,625)
V
head(V)
tail(V)

V1=5:100
V1
head(V1)
tail(V1)

V2=4.8:9.6
V2

V3=seq(4,9, by =0.4)
V3

V4=seq(10,20, length=5)
V4

### Indexing of vectors
V=seq(10,90, by=5)
V
V[2]
V[6]
V[1:5]
V[6:10]
V
V[-2] #Deleting 2nd number
V[-(2:5)]


#### Vector Arithmetic
V1=c(1,4,6)
V2=c(5,-5,5)
V1+V2

V1/V2

#### Vector element recycling
V1 = c(1,2,3,4)
V3 = c(5,6)
V1+V3
V3+V1
V=c("M","F")
V

### Vector element sorting
V = c(10,17,25,4,6,9,14)
sort(V)
sort(V, decreasing = T)

c=c("red","yellow","blue","pink","black","lavender","orange")
c
sort(c)


## Data Types and Data Structures in R
### Data Types: Numeric, Character, Integer, Factor and Logical

a=5.5 #Decimal values are Numeric type
a
str(a)
class(a)

b=5 #Integers
b
class(b)
str(b)

c= "Nepal" #Character
c
class(c)

c="2"
c
class(c)

x=5
y=6
z=x<y
z
class(z)

d=c("Welcome","to","R","class")
d
class(d)

e=1:10  
e
class(e)

V=c("Male", "Female", "Male")
class(V)
V1=as.factor(V)
V1
class(V1)

## User defined functions in R
scores_fa=c(4,12,45,24,15,35,42)
mean(scores_fa)
max(scores_fa)
min(scores_fa)
sd(scores_fa)

##Importing CSV file in R
data=read.csv(file="D:/RWorks/Financial_analytics/Data/scores_fin_ac.csv")
data
class(data)
V=data$score
class(V)

mean(V)
max(V)
min(V)

hist(V)
?hist()

hist(V, col="lavender")

library(ggplot2)
ggplot(data = data,aes(x=score))+geom_bar(fill="cornflower blue",col="black")+ggtitle("Distribution of Financial Accounting Scores: Fall Semester")+xlab("Scores (out of 100")+ylab("Frequency")
