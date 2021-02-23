## Query distributions and probabilities
# Exercise 1 Plot the cumulative distribution function in the range [-5,5]
q <- seq(-5,5,0.1)
vector_prob <- pnorm(q,mean=0,sd=1)
plot(x=q,y=vector_prob)

# Exercise 2 Plot the inverse cumulative distribution function for quantiles in 0.01 increment
p <- seq(0,1,0.01)
vector_quantile <- qnorm(p,mean=0,sd=1)
plot(p,vector_quantile)

# Exercise 3 Plot the density function in the range [-5,5]
x <- seq(-5,5,0.1)
vector_density <- dnorm(x,mean=0,sd=1)
plot(x,vector_density)

# Exercise 4 What is the probability of observing a value greater than 2?
1-pnorm(2,mean=0,sd=1)

# Exercise 5 What is the probability of observing a value between -2 and 2?
pnorm(2,mean=0,sd=1)-pnorm(-2,mean=0,sd=1)

# Exercise 6 What is the probability of observing a value more extreme than -2 or 2?
1-(pnorm(2,mean=0,sd=1)-pnorm(-2,mean=0,sd=1))