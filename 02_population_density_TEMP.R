# Script for using R

# operation
2 + 3 

# an object
samuele <- 2 + 3

# another object
gemma <- 4 + 6

# different ojects
samuele + gemma
samuele * gemma # instead of writing (2+3) * (4+6)
samuele ^ gemma

tma <- 5 * 4

tma + samuele + gemma # 20 + 5 + 10

# we are using the function c()
matteo <- c(5, 10, 20, 50, 80) # an array is a set of elements: this is the array of mammal species

sum(5, 10)
sum (5, 10) # I HATE THIS!!

elisa <- c(100, 80, 50, 20, 10) # an array of human deaths due to a disease 

plot(matteo, elisa)

# changing the point character
plot(matteo, elisa, pch=19)

# character exaggeration
plot(matteo, elisa, pch=19, cex=2)

# changing the color
plot(matteo, elisa, pch=19, cex=2, col="blue")
plot(matteo, elisa, pch=19, cex=2, col="chartreuse3")

# changing the labels
plot(matteo, elisa, pch=19, cex=2, col="chartreuse3", xlab="number of mamals", ylab="number of human deaths")

# increasing the axis dimension
plot(matteo, elisa, pch=19, cex=2, col="chartreuse3", xlab="number of mamals", ylab="number of human deaths", cex.axis=2)

# long function!
plot(matteo, 
     elisa, 
     pch=19, 
     cex=4, 
     col="maroon2", 
     xlab="number of mamals", 
     ylab="number of human deaths", 
     cex.axis=2,
     cex.lab=2)

# R code for population density

# Installing packages
install.packages("spatstat")

# Using the package(s)
library(spatstat)

# Recall the data
bei

# Looking at the points in space
plot(bei)

# Changing the pch
plot(bei, pch=15)

# Decreasing the dimension
plot(bei, pch=15, cex=.5)

# Drivers
bei.extra

# Plotting variables
plot(bei.extra)

# Subsetting a dataset: NEW CONCEPT!
# There are two different methods to make a subset:
# first: name of the variable and the $ symbol
# second: number of the layer and [] for tables, [[]] for map layers

elevation <- bei.extra$elev
# output
elevation

# Plot elevation
plot(elevation)

# Subset by the number of the layer/variable
elevation2 <- bei.extra[[1]]

# In case bei.extra was a table: bei.extra[1]

# Plot the new object
plot(elevation2)

# Creating our first map!
densitymap <- density(bei)

# Output
densitymap

# Plot the result
plot(densitymap)

# Plotting the points ontop of the density map
points(bei, cex=.5)

# New concept!: MULTIFRAME!
# Creating the multiframe
par(mfrow=c(1,2))
plot(elevation)
plot(densitymap)

# Exercise: Put the elevation map ontop of the densitymap
par(mfrow=c(2,1))
plot(elevation)
plot(densitymap)

# If you get any graphical ussue here is your friend:
dev.off()

# Code for studying population spread over space

# install.packages("spatstat")

library(spatstat)

bei

plot(bei)

# changing character
plot(bei, pch=15)

# decrease dimension
plot(bei, pch=15, cex=.5)

# ancillary variables
bei.extra

plot(bei.extra)

# selecting one layer, e.g., elev
el <- bei.extra$elev
plot(el)

el <- bei.extra[[1]]

# density map
dmap <- density(bei)
plot(dmap)
points(bei)

plot(el)
points(bei)

# Plotting together the density map and the elevation
el <- bei.extra[[1]]

# one object is dmap and the other is el
# how to plot the dmap beside el?
par(mfrow=c(1,2)) # we will solve this anti-human stuff soon!
plot(dmap)
plot(el)

# plot the dmap ontop of the el map
par(mfrow=c(2,1)) 
plot(dmap)
plot(el)

# if you want to close graphical devices this is your friend:
dev.off()

cl <- colorRampPalette(c("green", "red", "blue"))
plot(dmap, col=cl)

cl <- colorRampPalette(c("green", "red", "blue"))(100)
plot(dmap, col=cl)

# R colors are here:
# https://r-charts.com/colors/

cln <- colorRampPalette(c("chartreuse1", "brown2", "cyan", "lightblue"))
plot(dmap, col=cln)

# plot the dmap with two different color ramps one on top of the other
dev.off()

par(mfrow=c(2,1)) 
plot(dmap, col=cl)
plot(dmap, col=cln)


install.packages("terra")
install.packages("sdm")
library(terra)
library(sdm)


#change colors in our maps
cl <- colorRampPalette(c("magenta1","green","mediumpurple"))
plot(dmap, col=cl)

# Nuances
cl3 <- colorRampPalette(c("magenta1","green","mediumpurple"))(3)
plot(dmap, col=cl3)

cl10 <- colorRampPalette(c("magenta1","green","mediumpurple"))(10)
plot(dmap, col=cl10)

cl100 <- colorRampPalette(c("magenta1","green","mediumpurple"))(100)
plot(dmap, col=cl100)

# Exercise: make a multiframe with the map with 10 nuances ontop of that with 100
par(mfrow=c(2,1))
plot(dmap, col=cl10)
plot(dmap, col=cl100)

