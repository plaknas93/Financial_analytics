
#Multiple Linear Regression in R

data=read.csv(file="D:/RWorks/Financial_analytics/Data/stock_returns.csv")

##Variable Information
##1 Stock_Returns (continuous variable, e.g., percentage returns of a stock).
##2 Investment_Decision (binary variable: 1 if the stock is worth investing in, 0 otherwise).
##3 Market_Sentiment (scale of -1 to 1, based on news sentiment analysis).
##4 Interest_Rate (prevailing interest rate, e.g., 2%–10%).
##5 Inflation_Rate (e.g., 1%–7%).
##6 Trading_Volume (number of shares traded, in thousands).
##7 P_E_Ratio (Price-to-Earnings ratio of the stock).
##8 Variance (stock's historical variance).
##9 Volatility (stock's historical volatility. Also called standard deviation i.e Volatility = Sq root (Variance) ).
##10 E_P_Ratio (Reciprocal of PE ratio)

head(data)

#round off all data points to two decimal places
library(dplyr)
#data = data %>% mutate(across(where(is.numeric), ~ round(., 2)))

head(data)

#Run MLR
mod1=lm(data,formula= Stock_Returns~Variance+Volatility)
summary(mod1)

cor(data$Variance,data$Volatility)

mod2=lm(data,formula= Stock_Returns~P_E_Ratio+E_P_Ratio)
summary(mod2)

cor(data$P_E_Ratio,data$E_P_Ratio)


library(corrplot)
m=cor(data)
corrplot(m,method="number")

#Actual Model
mod3=lm(data,formula= Stock_Returns~Market_Sentiment+Interest_Rate+Inflation_Rate+Trading_Volume,P_E_Ratio+Volatility)
summary(mod3)

library(car)
vif(mod3)
vif(mod2)


#Logistic Regression
mod4=glm(data,formula= Analyst_Recom~Market_Sentiment+Interest_Rate+Inflation_Rate+Trading_Volume,P_E_Ratio+Volatility,family=binomial)
summary(mod4)
