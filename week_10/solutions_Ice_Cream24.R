getwd()


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

#1st graph
plot(puzzle,video,ylab="video score",xlab ="puzzle score",main="Video vs. puzzle score",pch=17,col="purple")

#2nd graph
boxplot(video~ice_cream, xlab="ice cream flavor",ylab="video score",col=c("white","chocolate","pink"),boxwex=0.5)

#3rd graph
pal<-wes_palette("Moonrise3",3,type="discrete")
barplot(table(puzzle_type,ice_cream),beside=T,main="Puzzle type meets ice cream flavour",ylab ="number of people",col=pal,legend.text=TRUE)


#sorting puzzle types! was asked many times
#this can be in 2 steps or 1 steps as below

boxplot(puzzle~as.factor(factor(puzzle_type,levels=c("rookie","average","pro"))))

#if you want to change the tick lables it is "names"!
#3rd graph
pal<-wes_palette("Moonrise3",3,type="discrete")
barplot(table(puzzle_type,ice_cream),names=c("vanilla","chocolate","strawberry"),col=pal)

#here is a way of combining chocolate and strawberry

table(ice_cream)
vanilla<-(ice_cream[ice_cream==1])
not_vanilla<-(ice_cream[ice_cream>1])

## similar plots with ice cream data using the ggplot2 package
# install ggplot package. Installation only necessary once
install.packages("ggplot2")
# load library. loading a library is always necessary when you want to use the code
library(ggplot2)

## 1st graph
ggplot(tut10, aes(x = puzzle, y = video)) +
  geom_point(color = "purple", shape = 17) +  # color and shape equivalent to col and pch
  labs(x = "puzzle score", y = "video score", title = "Video vs. puzzle score") +
  theme_bw()

## 2nd graph
# Convert ice_cream to a factor, needed for ggplot to read variable
tut10$ice_cream <- as.factor(tut10$ice_cream)

ggplot(tut10, aes(x = ice_cream, y = video, fill = ice_cream)) +
  geom_boxplot(width = 0.5) +  # equivalent to boxwex=0.5
  scale_fill_manual(values = c("white", "chocolate", "pink"),
                    name = "Ice Cream Flavor",  # Legend title
                    labels = c("Vanilla", "Chocolate", "Strawberry")) + # Legend labels
  labs(x = "ice cream flavor", y = "video score") +
  theme_minimal()

## 3rd graph
# for ggplot, a new dataframe using the table command is needed
IceCreamTable <- as.data.frame(table(tut10$puzzle_type, tut10$ice_cream))
colnames(IceCreamTable) <- c("puzzle_type", "ice_cream", "Freq")

ggplot(IceCreamTable, aes(x = ice_cream, y = Freq, fill = puzzle_type)) +
  geom_bar(stat = "identity", position = "stack") +
  scale_fill_manual(values = pal, name = "Puzzle Type") +
  scale_x_discrete(labels = c("vanilla", "chocolate", "strawberry")) +
  labs(x = "Ice Cream Flavor", y = "Frequency") +
  theme_minimal()

#########################
### plot airbnb data with ggplot
library(ggplot2)

air<-read.csv("airbnb.csv",header=T, sep=",")
attach(air)
str(air)

# for each city distances to nearest metro station and city center, each listing colorized by its price
pal2<-wes_palette("GrandBudapest1",3,type="discrete")
pal2
ggplot(air, aes(x = dist, y = metro_dist, color = price)) +
  geom_point(alpha = 0.5) +
  scale_color_gradient2(low = pal2[1], mid = pal2[2],high = pal2[3]) +
  labs(title = "AirBnB prices in 10 European cities",
       subtitle = "price listings with distance to city and nearest metro",
       x = "Distance to city center (km)",
       y = "Distance to nearest metro (km)",
       color = "Price (EUR)") +
  facet_wrap(~ city) +
  theme_minimal() +
  theme(legend.position = "bottom")

# boxplots for prices by room type and superhost status 
ggplot(air, aes(x = room_type, y = price, fill = factor(host_is_su))) +
  geom_boxplot() +
  scale_fill_manual(values = c("0" = "lightblue", "1" = "orange"), 
                    labels = c("0" = "Host", "1" = "Superhost")) +
  labs(title = "AirBnB prices by room type and superhost status",
       x = "room type",
       y = "price (EUR)",
       fill = "superhost status") +
  theme_minimal() +
  theme(legend.position = "bottom")