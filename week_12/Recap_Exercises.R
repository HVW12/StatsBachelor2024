################################
################################

# FINAL RECAP SHEET#
# DATA SET: CEREAL BRANDS  and SHAUN#
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


# Call the first 5 rows in the data set


#Look at the structure of the data set


# Look at the summary of the data set


# Plot a histogram of the sodium amount in all cereal brands


# Plot a box plot of the sugar amount in all cereal brands


#if you used attached you do not need "cereal$" same is true for "data = cereal" throught this script
#alternative code:

  
# Plot 2 box plots of potassium and sodium amount in one plot


# Plot box plots of sugars amount among different manufacturers


# Plot a scatter plot of sugars and ratings for all cereal brands


#---------------------------------------------------------------------------####
# Chi-Squared test
#---------------------------------------------------------------------------####

# Whether cereal brand from a specific manufacturer would affect its placing on
# the shelf

# Print out contingency table

# Conduct chi-squared test

  

# Can you draw a conclusion?

#exclude manufacturer A and R and perform chisq.test on reduced data (more complex commands from your cheat sheet!)

  


#---------------------------------------------------------------------------####
# Correlation Matrix - Visualization
#---------------------------------------------------------------------------####

# This time we are working with the object cerealNutri. It should only contain the 
# nutrient contents of the cereal brands and their ratings.
#try to create this dataframe based on the object "cereal"
#backup plan, load new data

#create subset without "name, mfr, type"
#multiple ways of doing this

#then turn shelf into an integer or throw it out
  
# Or  load the data if you did not succeed
cerealNutri <- read.csv("cereal_num.csv", sep = ",") 


# We have a lot of continuous variables in the data. It's worthwhile to have a 
# look at the correlation matrix to see the relationships among them.


# here you can try and visualize a correlation matrix for a better overview.
# You can install the package corrplot using the following command (need only
# once, delete the hashtag before install.packages)
  
install.packages("corrplot")
corrplot::corrplot(cor(cerealNutri), addCoef.col = "black", type = "upper")

# Some correlations are pretty strong. Let's confirm them with a correlation test.
# Correlation test between the sugar portion and the rating:

# Correlation test between the fiber portion and the rating:



#Do you meet the preconditions for the tests?



#transform fiber or use a different method


#Spearman correlation


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


# Inspect the data



#Visualise gain by diet and supplement




# There seems to be difference in gain by supplement and
#diet, confirm this with an ANOVA test:



# Let's look at the summary output of the test:


#Simplify the model if necessary


#did you meet preconditions of the test


# It is significant. So we can call for a post-hoc test:


# Can you draw a conclusion?
#which diet and which supplement would you recommend to the farmer?
#look at the boxplot, which has the highest gain?
#is it significant different from the lower gain?


