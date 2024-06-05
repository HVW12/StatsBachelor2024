##Pseudo code## ONLY FOR TUTORS

air<-read.csv("airbnb.csv",header=T, sep=",")
attach(air)


# Questions to guide the analysis:

# Which variables do I need?
# Which is the explanatory and response variable?
# What are the dependencies in my data?
# What is the data format of these variables?
# Which test do I need to compare the prices?
# How do I verify if my models are good?


#### Question 1
#  Do Rome, London, and Paris have significant price differences in the Airbnb listings?

## Subselect the cities ####
## Remember to detach and attach the data ---- (our use $ to refer to the respective data set)

## Create a box plot to visualize the differences ####


## Conduct the respective tests: in this case anova and tukey####


# Initial visual inspection

# Create boxplot, but only for Rome, London and Paris

#which tests do I need to compare differences in prices among cities?


#visual inspection



##---------


#### Question 2
# How many shared, private and entire homes are in Berlin and Budapest? 
# Do Airbn prices depend on room category in Berlin and Budapest?
# Is the effect different in different cities?


## Remember to detach and attach the data ----

## Subselect Berlin and budapest. Detach and attach accordingly----


## Check how many of each room_type exist in Berlin and Budapest using table() -----


## Run the appropriate models: anova and Tukey ----


## Verify the distribution of residuals by plotting a histogram of the model residuals ----


##------------


## Question 3 ####
# Which city has the most listings furthest away from the city centre? 
# Does the price depend on distance to the city centre or metro distance?

## detach and attach the respective data-----


## Create a boxplot of distance and city-----

## Create a linear regression model for the variables price and distance.Use log() for scaling----


## Verify the distribution of the residuals using a histogram----


## create a scatter plot for distance and price. Use log() for scaling. Draw a tendency line using abline()----


#------


## Question 4 ####
# Do bigger cities have more bedrooms? 
# Test for a significant relationship only with 0-3 bedrooms.

## Detach and attach the respective data----


## Create a contingency table for city and bedrooms----


## Run a chi-square model with contingency table you just created----


## Filter the data for bedrooms below 4----


## Run the chi-square model again----


#------


## Question 5 ####
# Which city has the most, which has the least super hosts?
# Does the price of the Airbnb listing depend on the host status?

## Create a contingency table for city and host_is_su. Run the chi square----


## Visualize the spread of prices depending of the superhost----


## Conduct the anova to test for differences between prices depending of the superhost.Check the residuals----


#------


## Question 6 ####
# Which city has the most, which has the least super hosts?
# Are there significant more clean apartments that are also super host apartment?

## Create a contingency table for city and host_is_su----


## Create contingency table for super hosts and cleanlines. Run a chi-square test to check for a significant pattern.----


#------

## Question 7 ####
# Do cities with Airbnb listings further away from the city centre have shorter distances to metro stations?

## Run a correlation test between distance from the city center and distance from metro stations----

## Plot this correlation----


## Check the distribution of both variables distance from city center and distance from metro station----


## Adjust the correlation test by using the spearman method----

#------


## Bonus question ####

#Can you tell based on this data if cities are gentrified? 

## Check the number of the cities in the listings----



## Set the graphical parameters for the plotting----


## Plotting the IQR of distance of each city using the function tapply()----


## For the data plotted, use the names of the cities----
       

## Run a boxplot for distance and city to compare. Use las=2 to show all the city names----



