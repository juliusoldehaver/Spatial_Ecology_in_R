# packages
#install.packages("ggplot2")
#install.packages("patchwork")
library(terra)
library(imageRy)
library(ggplot2)
library(patchwork)

# List of the data
im.list()

# exercise: import sun image as example and assign to sun
sun <- im.import("Solar_Orbiter_s_first_views_of_the_Sun_pillars.jpg")

# classifying the data
sunclass <- im.classify(sun, num_clusters=3)

# seed
sunc <- im.classify(sun, num_clusters=3, seed=42)

# importing data of matogrosso
# exercise: import the data of mato grosso and give them the names m1992 and m2006

m1992 <- im.import("matogrosso_l5_1992219_lrg.jpg")
m2006 <- im.import("matogrosso_ast_2006209_lrg.jpg")

im.multiframe(1,2)
plot(m1992)
plot(m2006)

# flip images (if they are upside down) - NOT NECESSARY FOR MY IMAGES (hence not as code just as fyi comment)
# m1992 <- flip(m1992)
# m2006 <- flip(m2006)

#classifying the matogrosso 1992 image into forest and human
m1992class <- im.classify(m1992, num_clusters=2)
# class 1: forest
# class 2: human

# Exercise: classify the image of Mato Grosso of 2006 with two classes
m2006class <- im.classify(m2006, num_clusters=2)
# class 1: human
# class 2: forest

# Frequency of pixels attaining to the classes of m1992class
f1992 <- freq(m1992class)

# calculating proportions
tot1992 <- ncell(m1992class)

# exercise: calculate the proportions of the two classes f/t

prop1992 = f1992 / tot1992
prop1992

# calculation percentages
perc1992 = prop1992*100
#forest: 83%
# human: 17%

# repeating the process for m2006
# Frequency of pixels attaining to the classes of m2006class
f2006 <- freq(m2006class)

# calculating proportions
tot2006 <- ncell(m2006class)

# exercise: calculate the proportions of the two classes f/t

prop2006 = f2006 / tot2006
prop2006

# calculation percentages
perc2006 = prop2006*100
# human: 55 %
# forest: 45 %

# creating a dataframe
class <- c("Forest", "Human")
perc1992 <- c(83, 17)
perc2006 <- c(45, 55)
tabout <- data.frame(class, perc1992, perc2006)

# Plotting stats
ggplot(tabout, aes(x=class, y=perc1992, color=class)) + 
  geom_bar(stat="identity", fill="white")
  
# Exercise: repeat for 2006
ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="white")

# Changing the fill color
ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_bar(stat="identity", fill="yellow")

# Change te geometry
# points
ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
  geom_point(stat="identity", fill="white")

# using the patchwork package to plot several plots together
# assign the plots to objects
Graph1992<-ggplot(tabout, aes(x=class, y=perc1992, color=class)) + 
      geom_bar(stat="identity", fill="white")
Graph2006<-ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
          geom_bar(stat="identity", fill="white")

Graph1992 + Graph2006

# Exercise: put one plot over the other (not site to site)
Graph1992 / Graph2006

# changing the scale of the data
Graph1992<-ggplot(tabout, aes(x=class, y=perc1992, color=class)) + 
      geom_bar(stat="identity", fill="white") +
      ylim(c(0,100))
           
Graph2006<-ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
      geom_bar(stat="identity", fill="white") +
      ylim(c(0,100))

Graph1992 + Graph2006

# Removing one legend
Graph1992<-ggplot(tabout, aes(x=class, y=perc1992, color=class)) + 
      geom_bar(stat="identity", fill="white") +
      ylim(c(0,100)) +
      theme(legend.position="none")
           
Graph2006<-ggplot(tabout, aes(x=class, y=perc2006, color=class)) + 
      geom_bar(stat="identity", fill="white") +
      ylim(c(0,100))

Graph1992 + Graph2006

# Using patchwork with satellite data
im.ggplot(m1992[[1]])
im.ggplot(m2006[[1]])

# plotting satellite data and stats together
s1 <- im.ggplot(m1992[[1]])
s2 <- im.ggplot(m2006[[1]])

# final plot
(s1 | s2) / 
(Graph1992 | Graph2006)

# Doing the same with RGB images
rgb1 <- im.ggplotRGB(m1992)
rgb2 <- im.ggplotRGB(m2006)

# Final plot
(rgb1 | rgb2) / 
(Graph1992 | Graph2006)
