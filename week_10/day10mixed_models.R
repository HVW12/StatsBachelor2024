#install the packages nlme and multcomp and call it by running the library command 
library(nlme)
library(multcomp)
getwd()

#load the splityield data 

yields<-read.table("splityield.txt",header=T)
attach(yields)
names(yields)

#inspect the data and understand the study design
str(yields)
table(block)
table(block,irrigation)
table(block,fertilizer)
table(block,density,fertilizer)

hist(yield)

#try to fit a mixed effect model, defining random and fixed effects

model1<-lme(yield~irrigation*density*fertilizer,random=~1|block/irrigation/density)
summary(model1)
model1$residuals
#simplify, leaving the significant terms in the model 
model2<-lme(yield~(irrigation+density+fertilizer)^2,random=~1|block/irrigation/density)
summary(model2)
cftest(model2)

#further reduce
model3<-lme(yield~irrigation*density+irrigation*fertilizer,random=~1|block/irrigation/density)
summary(model3)
cftest(model3)

#the following is a deeper dive into the model structure
#find the fitted values
str(model3)

#here they are
model3$fitted
#plotting response variable against the fitted values
plot(model3$fitted[,2],yield)
plot(model3$fitted[,3],yield)
plot(model3$fitted[,4],yield)

