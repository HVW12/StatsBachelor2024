#Tutorial day 3


#data to calculate the mean and median
#enter the values from the board below into the vector candy (separate by comma)
#for example name<-c(1,2,3)

candy<-c()
str(candy)
summary(candy)
boxplot(candy)
hist(candy)


#let's see how we can make this more "normal"
hist(log(candy))

#where is R currently storing and loading your data from?
getwd()

#you need to adjust it to the location of the txt or csv file on YOUR computer!This basically tells R where to find the data:
#set working directory (*hint* copy and paste from your last script, or use the menu above)
setwd("")
#next load data:
survey<-read.table("survey24superclean.txt",header=T)
attach(survey)
str(survey)
summary(survey)
View(survey)

# Chi-Square-Test (chisq.test)

#Link between pineapple on pizza and OS preference?

table(Pineapple_Pizza,OS) 

chisq.test(table(Pineapple_Pizza,OS))
chisq.test(table(Pineapple_Pizza,OS))$expected #shows expected values

#let's only check for Microsoft and Apple
#this is how you sub-select for Apple (does  not create new variable!)
Pineapple_Pizza[OS=="Apple"]
#this is how you sub select for several factor levels
Pineapple_Pizza[OS == "Apple" | OS == "Microsoft" ]
#for the chisq.test you need to do this for both variables 
#(if you want a shorter command structure create new variables instead)
chisq.test(table(Pineapple_Pizza[OS == "Apple" | OS == "Microsoft" ],OS[OS == "Apple" | OS == "Microsoft" ])) 
chisq.test(table(Pineapple_Pizza[OS == "Apple" | OS == "Microsoft" ],OS[OS == "Apple" | OS == "Microsoft" ]))$expected 

#Test other variables from the survey that you can test with a Chi-Square-Test

#here is the example from R
?chisq.test
M <- as.table(rbind(c(762, 327, 468), c(484, 239, 477)))
dimnames(M) <- list(gender = c("F", "M"),
                    party = c("Democrat","Independent", "Republican"))
(Xsq <- chisq.test(M))  # Prints test summary
Xsq$observed   # observed counts (same as M)
Xsq$expected   # expected counts under the null


#Let's exclude all those NA's from the survey
?NA
?na.omit
surveynew<-na.omit(survey)

#here is what you do if you want to save the new shorter table as a csv file

write.csv(surveynew,"survey24_NA_out.csv")

survey_new<-read.csv("survey24_NA_out.csv")
attach(survey_new)

