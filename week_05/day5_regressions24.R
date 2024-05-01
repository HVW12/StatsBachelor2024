getwd()

#this data set is growth of caterpillars [mg] in relation to tannin concentration [micromole] in their diet
raupen<- read.table("regression.txt",header=T)
attach(raupen)
names(raupen)
str(raupen)
dim(raupen)
raupen
View(raupen)
# data examination
plot(tannin,growth)

#changing the look of your graph
?par
plot(tannin,growth,pch=1,col = "blue",xlab="tannin concentration [micromole]",ylab="caterpillar growth [mg]")
# normal distribution
hist(growth)
ks.test(growth,mean(growth))
shapiro.test(growth)

#graphical inspection of relation
plot(tannin,growth,pch=0)
model<-lm(growth~tannin)
abline(model,col="red")
summary(model)


# modeling
model<-lm(growth~tannin) #note "model" is not a command this is only a name
summary(model)

#you can also write
summary(lm(growth~tannin))

str(summary(model))

hist(resid(model))
plot(resid(model))
shapiro.test(resid(model))

#next load ecology practical data:
eco<-read.csv("ring_count_22.csv",header=T,sep=",")
str(eco)
attach(eco)
View(eco)
plot(diam,rings)
model<-lm(rings~diam)

plot(diam,rings,xlab ="Stem diameter [cm]", ylab ="Number of growth rings",pch=16)
abline(model,col="red")

summary(model)
hist(resid(model))

### multiple linear regression

# load data airbnb data (see file "info_airbnb_variables.jpg)
air<-read.csv("airbnb.csv",header=T, sep=",")
summary(air)
#inspect data
attach(air)
names(air)
str(air)
dim(air)
#how is price distributed?
hist(price)
#how is log(price)distributed?
hist(log(price))
#what about guest satisfaction?
hist(guest_sati)
#does a transformation help?
hist(sqrt(guest_sati))

#what about the independent variables?
par(mfrow=c(2,2))
hist(dist);hist(metro_dist);hist(cleanlines);hist(bedrooms)
#we can try to transform metro distance and distance
hist(log(metro_dist+1))
hist(log(dist))
#does log price depend on cleanlines, number of bedrooms, log distance to centre and log metro distance?
airmod <- lm(log(price)~cleanlines+bedrooms+log(dist)+log(metro_dist+1))
summary(airmod)
hist(resid(airmod))
#throw out the insignificant variables
airmod2 <- lm(log(price)~bedrooms+dist+log(metro_dist+1))
summary(airmod2)
hist(resid(airmod2))

# Install and load the ggcorrplot package
install.packages("ggcorrplot")
library(ggcorrplot)

# Reduce air data to numeric variables from the model 
reduced_data <- subset(air, select = c(bedrooms,dist,metro_dist,cleanlines))
# Compute correlation at 2 decimal places
corr_matrix = round(cor(reduced_data), 2)

# Compute and show the  result
ggcorrplot(corr_matrix, hc.order = TRUE, type = "lower",
           lab = TRUE)
#only choose independent variables that do not correlate with each other
airmod3 <- lm(log(price)~bedrooms+log(dist))
summary(airmod3)
hist(resid(airmod3))


# select London for multiple regression
London <- air[city == 'London',]

detach(air)
attach(London)

dim(London)
summary(London)
# multiple regression with guest satisfaction as dependent and five characteristics as independent variables
london_mod1<- lm(log(price)~cleanlines+bedrooms+log(dist))
summary(london_mod1)
hist(resid(london_mod1))

london_mod2<- lm(guest_sati~cleanlines+bedrooms+log(dist)+log(price))
summary(london_mod2)
hist(resid(london_mod2))

# compare London with other cities
detach(London)
attach(air)
boxplot(guest_sati ~ city)
boxplot(price ~ city)

#now try multiple regression with other cities....


     