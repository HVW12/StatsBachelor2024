################################
################################

# FINAL RECAP EXERCISE SOLUTION SHEET#
# DATA SET: CEREAL BRANDS #
# 
# by Chan Le, 16.06.2020 edited by HZ 26.06.23
#remember: there is usually more than one way to write code, depending on if you attached the data or not for example, if your code looks slightly different but you get the same result you are doing fine"
# Link to data set description:
# https://www.kaggle.com/crawford/80-cereals

################################
################################

#---------------------------------------------------------------------------####
# Load the data
#---------------------------------------------------------------------------####

# Run these lines to load necessary packages and data

  #set your working directory for this session and 
  # Load the data 
  cereal <- read.csv("cereal_format.csv", sep = ",") 
  
  # Coerce some variables to the right data format
  cereal$rating <- as.numeric(cereal$rating)
  cereal$fiber <- as.numeric(cereal$fiber)
  cereal$carbo <- as.numeric(cereal$carbo)
  cereal$shelf <- as.factor(cereal$shelf)


#---------------------------------------------------------------------------####
# Overview, descriptive Statistics, and basic plots
#---------------------------------------------------------------------------####

# Take a look at the whole data set
View(cereal)
cereal
# Call the first 5 rows in the data set
head(cereal, 5)

#Look at the structure of the data set
str(cereal)

# Look at the summary of the data set
summary(cereal)

# Plot a histogram of the sodium amount in all cereal brands
hist(cereal$sodium)

# Plot a box plot of the sugar amount in all cereal brands
boxplot(cereal$sugars)

#if you used attached you do not need "cereal$" same is true for "data = cereal" throughoutt this script
#alternative code:
attach(cereal)
boxplot(sugars)

# Plot 2 box plots of potassium and sodium amount in one plot
boxplot(cereal$sodium, cereal$potass)

# Plot box plots of sugars amount among different manufacturers
boxplot(sugars ~ mfr, data = cereal)

# Plot a scatter plot of sugars and ratings for all cereal brands
plot(cereal$sugars, cereal$rating)

#---------------------------------------------------------------------------####
# Chi-Squared test
#---------------------------------------------------------------------------####

# Whether cereal brand from a specific manufacturer would affect its placing on
# the shelf

# Print out contingency table
table(cereal$mfr, cereal$shelf)

# Conduct chi-squared test
chisq.test(table(cereal$mfr, cereal$shelf))

?chisq.test

# Can you draw a conclusion?

#exclude manufacturer A and R and perform chisq.test on reduced data (more complex commands from your cheat sheet!)
withoutAR<-subset(cereal, mfr != "A" & mfr!="R")
str(withoutAR)
str(cereal)
chisq.test(withoutAR$mfr,withoutAR$shelf)
table(withoutAR$mfr, withoutAR$shelf)
#ok it is still n.s. and we still receive warning message. The reason is too many values below 5...


#---------------------------------------------------------------------------####
# Correlation Matrix - Visualization
#---------------------------------------------------------------------------####

# This time we are working with the object cerealNutri. It should only contain the 
# nutrient contents of the cereal brands and their ratings.
#try to create this data frame based on the object "cereal"
#backup plan, load new data

#create subset without "name, mfr, type"
#multiple ways of doing this
str(cereal)
cerealNutri<-(cereal[,4:16])
cerealNutri
View(cerealNutri)
str(cerealNutri)

#then turn shelf into an integer or throw it out
cerealNutri$shelf <- as.numeric(cerealNutri$shelf)

# Or  load the data if you did not succeed
cerealNutri <- read.csv("cereal_num.csv", sep = ",") 

attach(cerealNutri)

# We have a lot of continuous variables in the data. It's worthwhile to have a 
# look at the correlation matrix to see the relationships among them.
cor(cerealNutri)

# here you can try and visualize a correlation matrix for a better overview.
# You can install the package corrplot using the following command (need only
# once, delete the hashtag before install.packages)
  
# install.packages("corrplot")
corrplot::corrplot(cor(cerealNutri), addCoef.col = "black", type = "upper")

# Some correlations are pretty strong. Let's confirm them with a correlation test.
# Correlation test between the sugar portion and the rating:
cor.test(cerealNutri$sugars, cerealNutri$rating)

# Correlation test between the fiber portion and the rating:
cor.test(cerealNutri$fiber, cerealNutri$rating)

#Do you meet the preconditions for the tests?
hist(cerealNutri$sugars)
hist(cerealNutri$rating)
hist(cerealNutri$fiber) #no way
#transform fiber or use a different method
hist(log(cerealNutri$fiber)) # bit better
shapiro.test(cerealNutri$sugars);shapiro.test(cerealNutri$rating); shapiro.test(cerealNutri$fiber)

#Spearman correlation
cor.test(cerealNutri$sugars, cerealNutri$rating,method="spearman")
cor.test(cerealNutri$fiber, cerealNutri$rating,method="spearman")
# Can you draw a conclusion?

#---------------------------------------------------------------------------####
# ANOVA & Post-Hoc
#---------------------------------------------------------------------------####

# New data set "growth" Crawley (2007) The R book.Imperial College London at Silwood Park, UK
#A factorial experiment has two or more factors, each with two or more levels, 
#plus replication for each combination of factors levels. 
#Our example comes from a farm-scale trial of animal diets. 
#There are two factors: diet and supplement. 
#Diet is a factor with three levels: barley, oats and wheat. 
#Supplement is a factor with four levels: agrimore, control, supergain and supersupp. 
#The response variable is weight gain after 6 weeks.

#Load the data
shaun<-read.table("growth.txt",header=T)
attach(shaun)

# Inspect the data
str(shaun)
summary(shaun)
table(supplement) #balanced design
table(diet) #balanced design
View(shaun) #factorial design, we can test for interactions

#Visualise gain by diet and supplement

boxplot(gain~diet:supplement,las=2)
boxplot(gain~supplement:diet,las=2)
#if you do not want the x-axis label: leave the description empty
boxplot(gain~diet:supplement,las=2,xlab="")
boxplot(gain~supplement:diet,las=2, xlab="")
# There seems to be difference in gain by supplement and
#diet, confirm this with an ANOVA test:

testANOVA <- aov(gain~diet*supplement)

# Let's look at the summary output of the test:
summary(testANOVA)

#Simplify the model if necessary
testANOVA2 <- aov(gain~diet+supplement)
testANOVA2 <- update(testANOVA ,.~.-diet:supplement) #other way of updating
summary(testANOVA2)

#did you meet preconditions of the test
hist(resid(testANOVA2))  #Looks good to me

# It is significant. So we can call for a post-hoc test:
TukeyHSD(testANOVA2)

# Can you draw a conclusion?
#which diet and which supplement would you recommend to the farmer?
#look at the boxplot, which has the highest gain?
#is it significant different from the lower gain?

#Conclusion: barley is the clear winner, but agrimore is not
#significantly better than supersupp, so you can recommend either
#supergain not so "super", not even better than the control

