## Generate and visualise a distribution
# Exercise 1 Generate a vector of 1000 normally distributed values with mean 10 and standard deviation 5
my_norm <- rnorm(1000,mean=10,sd=5)
my_norm

# Exercise 2 Inspect the output of the summary() function for that vector
summary(my_norm)

# Exercise 3 Compute the mean and standard deviation for those values
mean(my_norm)
sd(my_norm) # sd is to calculate the standard deviation

# Exercise 4 Compute the deciles (i.e. 10 evenly spaced quantiles) for those values
quantile(my_norm,probs=seq(0,1,0.1))

# Exercise 5 Visualise the distribution of those values as a histogram
hist(my_norm,breaks = 50) # generate the histogram

# Exercise 6 Visualise as vertical lines on the histogram: the mean (red solid), median (red dashed),
# one standard deviation from the mean (blue solid), and one median absolute deviation from the median (blue dashed).
abline(v=mean(my_norm),col='red') # Add a vertical line at mean
abline(v=median(my_norm),col='red',lty='dashed') # Add a vertical line at median
abline(v=mean(my_norm)-sd(my_norm),col='blue',lty='solid') # Add a vertical line at sd from mean
abline(v=mean(my_norm)+sd(my_norm),col='blue',lty='solid')
abline(v=median(my_norm)-sd(my_norm),col='blue',lty='dashed') # Add a vertical line at sd from median
abline(v=median(my_norm)+sd(my_norm),col='blue',lty='dashed')

# Exercise 7 Generate a new vector with a lot more values (e.g., one million).
# Draw again a histogram. How does the distribution compare with more data points?
my_norm_2 <- rnorm(1000000,mean=10,sd=5)
hist(my_norm_2,breaks = 50)

# Grid plots in 2 rows and 1 column
par(mfrow=c(2,1))
hist(my_norm,breaks = 50)
hist(my_norm_2,breaks = 50)
par(mfrow=c(1,1)) # Set it back to 1 plot in 1 row and 1 column
