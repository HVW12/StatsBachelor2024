getwd()
#setting my working directory (where is my file?)


#telling R which file to work with

tut10<-read.table("Ice_cream.txt",header=T)

str(tut10)
names(tut10)


summary(tut10)

summary(puzzle) #why do you get an error message here?

attach(tut10)
#The data was collected on 200 random citizens and are scores on various tests, including a video game and a puzzle. 
#The data also includes the person’s favorite flavor of ice cream – vanilla (1), chocolate (2) or strawberry (3).
head(tut10)
tut10
View(tut10)

?plot

?boxplot

?hist

?barplot

?par


#create a graph with this data set, please make it colorful and use a diversity of symbols!
#you have 15 min you can work in groups




#here is a cool color palette
install.packages("wesanderson")
library(wesanderson)
?wes_palette

#now try to re-create the graphs you see up front

#first graph has purple triangles, main title, x axis and y axis label

#second graph has three different colors, a x axis an y axis label

#third graph has three different colors, main tittle, y axis label and a legend 




#here is a way of combining chocolate and strawberry

table(ice_cream)
vanilla<-(ice_cream[ice_cream==1])
not_vanilla<-(ice_cream[ice_cream>1])


# next choose any data set in R and make any graph

data()

# next install and use the ggplot2 package to create a graph with the airbnb data

# for each city distances to nearest metro station and city center, each listing colorized by its price

# boxplots for prices by room type and superhost status

