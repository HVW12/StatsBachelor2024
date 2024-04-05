#-- Warm up R script--
# The objective of this script is that you practice the basic commands and
#gain some confidence. At the end there is three challenges. The solution
# will be uploaded next Thursday. 

#This is NOT homework, but I highly recommend you to do the challenges

#You can put any number and do simple operations
3
3+3
3*2
5^2

#Lets create variables or objects
x <- 8
y <- 5
z <- 7

#You can do operations with these variables
x + y
x*y
x^y/z

# You can erase the variable using rm()
rm(x)
rm(y,z)

#let's create some sequences
#sequences are series of numbers, for example:
seq(1,10)

#Create a sequence starting from 10 until 100 in increments of 5
seq(10,100,5)

#Create a sequence starting from 10, in increments of 5, with a lenght of 10
#length means the number of elements in the sequence
seq(10,by=5,length=10)

#Could you see the difference between the two previos sequences

#You can store the sequence in a variable
my_seq <- seq(2,40,2)

#you can do operations with that sequence, for example:
my_seq*2
my_seq + my_seq + 10

#Lets create some vectors
# "c" means concatenate, which means "putting together"
c(1,2)

# you can put any type of data in a vector, for example
c(4, "hola", TRUE)

#of course you can store vectors
x <- c(1,2,3)

#and do some operations with it
x + x
x * x
x/x

#you can also put vectors inside a vector
y <- c(5,6,7)
z <- 8
w <-c(x,x,y,z)
w

#you can do some logical operations with vectors
p <- c(12,9,8,14,7,16,3,2,9)
p > 10
p > 10 & p < 16


#Vectors can be very long and also you may need to retrieve specific elements
#let's create this vector
my_vector <- c(seq(4,50,2))

#getting the lenght of the vector
length(my_vector) #that is the number of elements in the vector

#getting the first element of the vector
my_vector[1]

#getting several elements of the vector
my_vector[5:9]

#getting the last element of the vector
last_element <- length(my_vector)
my_vector[last_element]



#let's do some plotting. First let's create the vectors
x <- c(-6,-4,-2,0,2,4,6)
y <- c(36,16,4,0,4,16,36)

#now plotting using the function plot()
plot(x,y)

#you can make your plot more beautiful. Let's check
#let's see the plot() documentation using ?plot

?plot

#In your right-bottom window, go to the The Default Scatterplot Function

#Instead of points, let's use draw instead 
plot(x,y, type = "l")

#Maybe use both lines and points
plot(x,y, type = "b" )

#let's add a title and labels to the axis

plot(x,y, type = "b", main = "My first plot", xlab = "independent variable",
     ylab = "response variable")

#lets change the size of the dots and lines. Use cex and a number higher than 1
plot(x,y, type = "b", main = "My first plot", xlab = "independent variable",
     ylab = "response variable", cex = 2)


#let's play around with colors. 
plot(x,y, type = "b", main = "My first plot", xlab = "independent variable",
     ylab = "response variable", cex = 2, col="skyblue3")

#to know which colors are availabe, type "colors()"
colors()


#CHALLENGE 1
#Create a sequence of numbers from 4 to 760 in increments of 4

#CHALLENGE 2
#1, Create a vector called "rain" using seq(4,760,4).
#2, Create a variable called "sum_rain" where you
#store the sum of all the elements in the vector
#3, Divide this sum by the total number of elements in the vector.
#3. Store the result in a variable called "result"
#4. Calculate the difference between "result" and the 27th element
# of the vector.


#CHALLENGE 3
#1. Consider the function y = x^3 - 4x^2 + x - 4
#2. Plot the function evaluating it with 
# a sequence of values from -10 to 10 in increments of 2.
#3. Add the corresponding title and labels
#4. Change the size of the dots to 3
#5. Change the colors of the dots to skyblue4

