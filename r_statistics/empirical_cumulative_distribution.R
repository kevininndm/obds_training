## Compute an Empirical Cumulative Distribution Function
# Exercise 1 Use the ecdf() function to compute the empirical cumulative distribution function for the variable Sepal.Length in the iris data set
# iris data set is built-in in R
iris_ecdf <- ecdf(iris$Sepal.Length)
str(iris_ecdf)

# Exercise 2 Use the  plot() function to visualise the empirical cumulative distribution function
plot(iris_ecdf)

# Exercise 3 Use the knot() function on the ecdf output and compare this with the list of unique values for the variable Sepal.Length
knots(iris_ecdf) # knots() funtion is to sort the unique values
sort(unique(iris$Sepal.Length))

# irsi_ecdf is a funtion (from the str() function), use is to check the probability of a specific value
iris_ecdf(6)