getwd()

###########################################


#Let's use some data in R: toothgrowth data
data() #opens a Window with all the available data sets 

?ToothGrowth
str(ToothGrowth)

new_dose<-as.factor(ToothGrowth$dose) #dose is numeric here, but should be a factor 
str(new_dose)
model4<-aov(len~supp*new_dose,data=ToothGrowth)
model5<-aov(len~supp+new_dose,data=ToothGrowth)
summary(model4)
summary(model5)

TukeyHSD(model4)
#create boxplot of this data! 
?boxplot


#next load airbnb data:
air<-read.csv("airbnb.csv",header=T, sep=",")
attach(air)
str(air)

#1st visually inspect your data with boxplots
#which variables could be your factors and which your dependent variable?

boxplot(log(price)~city)
table(city)

abbbv<- subset(air, city %in% c("Amsterdam", "Barcelona", "Berlin","Budapest","Vienna"))
str(abbbv)
table(abbbv$city) #if you want to call the new subset "abbbv" you need to use the $
#or instead detach "air" and attach "abbbv", because the names are the same for both data frames
detach(air)
attach(abbbv)
boxplot(log(price)~city)

#now test if price significantly differs between Amsterdam, Barcelona, Berlin, Budapest, Vienna with an ANOVA
#+#+#+#+#+#+#+#+#+#+#+#+#+#
price_city<-aov(log(price)~city)
summary(price_city)
hist(resid(price_city))

TukeyHSD(price_city)


#next try for guest satisfaction
boxplot(guest_sati~city)
sati_city<-aov(guest_sati~city)
summary(sati_city)
hist(resid(sati_city)) #what do you say?

#what else could we test?

####################################
shaun<-read.table("growth.txt",header=T)
str(shaun)

attach(shaun)
table(supplement)
table(diet)
boxplot(gain~diet:supplement)
#how can you change the label for the x-Axis so that it is readable?
boxplot(gain~diet:supplement,las=2, cex.axis=0.8,xlab="")
#what happens if you switch diet and supplement?

shaun_model<-aov(gain~diet*supplement)
summary(shaun_model)
#remove non significant model variables
shaun_model2<-aov(gain~diet+supplement)
summary(shaun_model2)

TukeyHSD(shaun_model2)

#what would you feed your farm animals? 










