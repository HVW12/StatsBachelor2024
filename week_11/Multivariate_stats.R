library(vegan)
library(cluster)
#Load  classic data from Jongman
data(dune);data(dune.env)

#inspect the data
str(dune)
?dune
View(dune)
#Make a DCA of the dataset
modeldca<-decorana(dune)
#How much does the model explain
modeldca
#How does it look?
plot(modeldca)
#choose two species distant to each other and find a description/ picture
#Plot only the sites
plot(modeldca,display=c("sites"))

#Make a cluster analysis
modelclust<-agnes(dune,method="ward")
#Click twice. Compare with the DCA, use the blue arrows in the plot window
plot(modelclust)

#Here is a PCA of the swiss data
data(swiss)
#inspect data....

modelpca<-prcomp(swiss, scale=T)
summary(modelpca)
plot(modelpca)
par(xpd=T)
biplot(modelpca)

#Now a DCA with environmental data fitted
data(varechem);data(varespec)

#inspect data

modeldca2<-decorana(varespec)
plot(modeldca2)

modelfit<-envfit(modeldca2,varechem,perm=1000)
plot(modelfit)

#example with mtcars
data(mtcars)
modelpca2<-prcomp(mtcars,scale=T)
biplot(modelpca2)


