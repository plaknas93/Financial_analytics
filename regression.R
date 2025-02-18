#Determining Beta

itc_ret=c(0.00,4.00,1.00,-5.00,5.00,11.00,6.00,-6.00,-3.00,-1.00,-5.00,-6.00)
sensex_ret= c(2.00,1.00,-1.00,7.00,3.00,1.00,2.00,-6.00,1.00,-2.00,-1.0,-2.00)

data= data.frame(sensex_ret,itc_ret)
head(data)

library(ggplot2)
ggplot(data,aes(x=sensex_ret,y=itc_ret))+geom_point(size=3,shape=18,col='dark blue')+ggtitle("Scatterplot: ITC vs Sensex (Monthly return over last 12 months)")+xlab("Sensex returns %")+ylab("ITC returns %")

#Regression
mod1=lm(data,formula=itc_ret~sensex_ret)
summary(mod1)

library(ggpmisc)
ggplot(data,aes(x=sensex_ret,y=itc_ret))+geom_point(size=3,shape=18,col='dark blue')+ggtitle("Scatterplot: ITC vs Sensex (Monthly return over last 12 months)")+xlab("Sensex returns %")+ylab("ITC returns %")+ geom_smooth(method = "lm")+stat_poly_line()+stat_poly_eq(use_label(c("eq", "R2")))

