#Correlations
#first example from video "How to calculate Pearson's correlation by hand"
# defining / loading your data
Student_attitude <- c(94,73,59,80,93,85,66,79,77,91)
correct_answers <- c(17,13,12,15,16,14,16,16,18,19)

# Pearson's correlation coefficient
cor(Student_attitude,correct_answers)
#Correlation test statistic
cor.test(Student_attitude,correct_answers)
# Testing for normality
shapiro.test(Student_attitude)
shapiro.test(correct_answers)

hist(Student_attitude)
hist(correct_answers)
plot(Student_attitude,correct_answers)


###next load survey data from day 1
getwd( )
setwd("")
trivial<-read.csv("survey24_NA_out.csv",header=T, sep=",")

attach(trivial)
str(trivial)
View(trivial)

cor.test(siblings_number,pets)
hist(siblings_number)
hist(pets)
summary(siblings_number)
summary(pets)
#what is the logarithm of zero?
log(0)

hist(log(siblings_number+1))
hist(log(pets+1))
#ok, our data is not normally distributed let's try a Spearman rank correlation instead
?cor.test
cor.test(siblings_number,pets,method="spearman")
cor.test(siblings_number,pets,method="kendall")
plot(siblings_number,pets)
table(siblings_number)

sib2<-(siblings_number[pets<200])
pets2<-(pets[pets<200])
summary(sib2)
summary(pets2)
cor.test(sib2,pets2,method="spearman")
plot(sib2,pets2)
#find other variables in the survey data (trivial data) suitable for a correlation
str(trivial)
hist(Pinky)

#next data set
#load data
auto<-read.table("Automobile_R.txt",header=T)
attach(auto)
str(auto)
summary(auto)
#this shows the correlation coefficients for the entire data set (only possible if your data set contains only numbers)
cor(auto)
#let's correlate automobile width with length
cor.test(width,length)

#how does this look like?
plot(width,length)
#but are the two continuous variables normally distributed?
hist(width)
hist(length)
shapiro.test(width)
summary(width)
hist(log(width))



#if the data is not normally distributed there are two non-parametric rank correlations to choose from
cor.test(length,width,method="spearman")
cor.test(length,width,method="kendall")

#next wheel base (= horizontal distance between the centers of the front and rear wheels) and length
cor.test(wheel.base,length)
hist(wheel.base)
hist(length)
shapiro.test(wheel.base)
shapiro.test(length)
#find a continuous variable in this data set that is normally distributed based on the Shapiro test


