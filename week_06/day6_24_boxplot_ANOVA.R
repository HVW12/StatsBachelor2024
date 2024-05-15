getwd()

###########################################
restaurant<-read.table("boxplot.txt", header =T)
attach(restaurant)#data from Khan Academy video "Constructing a box and whisker plot"
restaurant
median(miles)
mean(miles)
length(miles)
range(miles)

summary(miles)

boxplot(miles)
boxplot(miles,ylab="miles",boxwex=0.5,col="seagreen")
?boxplot

#let's see how this would look like with outliers
#this is how you add an observation to a dataframe
#create a new name to keep the old dataframe
new<-rbind(restaurant,40)

boxplot(new)
#add a very large outlier and our boxplot will get squashed
new2<-rbind(restaurant,1000)
boxplot(new2)

#outlier = the values of any data points which lie beyond the extremes of the whiskers.
# extremes = 1.5 * IQR
########################################################
####ANOVA example
dat<-read.table("yields.txt",header=T)
str(dat)
dat
summary(dat)
attach(dat)
boxplot(yield~soil,ylab="yield [mg]")
#software always sorts alphabetical, if you want to sort from lowest to highest:change order by defining soil to be an ordered factor
soil<-factor(soil,levels=c("sand","clay","loam"))
#plot again
boxplot(yield~soil,ylab="yield [mg]")
table(soil)

#################################
#ANOVA
#two possibilities to calculate ANOVA
#1.
model<-lm(yield~soil)
anova(model)
summary(model)

#2.
model<-aov(yield~soil)
summary(model)

hist(resid(model))

#you can also use the plot(model)command, just make sure you adjust it the the name of your model, this model is called "model"
plot(model)

#you have to chose option 2 (see above) for a posthoc-Test = to test every factor level against each other
#Post Hoc test
TukeyHSD(model)

#now try it with fertilizer
table(fertilizer)
model2<-aov(yield~fertilizer)
summary(model2)

#t-test
?t.test
t.test(yield[fertilizer=="giant"],yield[fertilizer=="lushly"])

#now try a two-way-ANOVA
model3<-aov(yield~soil*fertilizer)
summary(model3)

#Let's use some data in R: toothgrowth data
data() #opens a Window with all the available data sets 

?ToothGrowth
str(ToothGrowth)

new_dose<-as.factor(ToothGrowth$dose) #dose is numeric here, but should be a factor 
str(new_dose)
model4<-aov(len~supp*new_dose,data=ToothGrowth)
summary(model4)
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













