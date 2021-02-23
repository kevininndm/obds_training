## Statistical tests
## The iris data set gives the measurements in centimeters of the variables sepal length and width and petal length and width, respectively,
## 50 flowers from each of 3 species of iris

# Exercise 1 Use the summary() function to view some information about each column
summary(iris)

# Exercise 2 Visualise the distribution of Sepal.Length, stratified by species
# Use histogram
par(mfrow=c(2,2))
hist(iris$Sepal.Length[iris$Species=='setosa'],breaks=10,labels=FALSE,main=NULL,col='red')
hist(iris$Sepal.Length[iris$Species=='versicolor'],breaks=10,labels=FALSE,main=NULL,col='blue')
hist(iris$Sepal.Length[iris$Species=='virginica'],breaks=10,labels=FALSE,main=NULL,col='green')
par(mfrow=c(1,1))

# The following are the same as the above
hist(iris[iris$Species=='setosa','Sepal.Length'],breaks=10,labels=FALSE,main=NULL,col='red')
hist(iris[iris$Species=='versicolor','Sepal.Length'],breaks=10,labels=FALSE,main=NULL,col='blue')
hist(iris[iris$Species=='virginica','Sepal.Length'],breaks=10,labels=FALSE,main=NULL,col='green')

# Use density
par(mfrow=c(1,1))
plot.new() # To plot a new plot
range(iris$Sepal.Length) # To check the range of the Sepal.Length
plot.window(xlim=c(4,8),ylim=c(0,1.2)) # To set the x and y limit
lines(density(iris$Sepal.Length[iris$Species=='setosa']),col='red') #Use line() to add line to the plot
lines(density(iris$Sepal.Length[iris$Species=='versicolor']),col='blue')
lines(density(iris$Sepal.Length[iris$Species=='virginica']),col='green')
axis(side=1,at=seq(4,8,0.5)) # To add x-axis
axis(side=2,at=seq(0,1.2,0.2)) # To add y-axis

# Exercise 3 Is Sepal.Length length normally distributed? Overall? Within each species?
plot(density(iris$Sepal.Length))
shapiro.test(iris$Sepal.Length)
shapiro.test(iris$Sepal.Length[iris$Species=='setosa'])
shapiro.test(iris$Sepal.Length[iris$Species=='versicolor'])
shapiro.test(iris$Sepal.Length[iris$Species=='virginica'])

# Exercise 4 Is there a significant variation of Sepal.Length between the various species?
# ANOVA test
anova_iris <- aov(Sepal.Length~Species,iris)
summary(anova_iris)
# Kruskal test
kruskal_iris <- kruskal.test(Sepal.Length~Species,iris)
kruskal_iris
# Run t test between 2 groups, because the ANOVA test showed significant difference among the 3 groups
tukey_iris <- TukeyHSD(anova_iris)
View(tukey_iris$Species)
