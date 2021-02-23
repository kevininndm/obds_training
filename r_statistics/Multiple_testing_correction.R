## Exercise 1 For each gene (i.e. row) in logcounts.csv, use cell_metadata.csv  and a statistical test of your
# choice to identify gene differentially expressed in cells infected with Salmonella relative to the control uninfected cells.
# Suggestion: write the code to test one gene, refactor the code into a function that returns the p-value, and use vapply to apply that function to all the genes.
# Load the data
logcounts <- read.csv('data/logcounts.csv',row.names = 1)
View(logcounts)
logcounts <- as.matrix(logcounts)

cell_metadata <- read.csv('data/cell_metadata.csv',row.names=1)
View(cell_metadata)

# Could use transpose and combine the logcounts and cell_metadata
#logcounts <- t(logcounts)
#View(logcounts)
# Check if the order of the names match before cbind
#all(row.names(logcounts) == row.names(cell_metadata))
# recorder cell_metadata so that the rownames order matches the logcounts
#cell_names <- row.names(logcounts)
#cell_metadata <- cell_metadata[cell_names,]
# combine the transposed logcounts and cell_metadata$Infection
#data_combine <- cbind(infection=cell_metadata,as.data.frame(logcounts)) # cbind will combine the data into string
#View(data_combine)
#class(data_combine)


# define a function to run the test by row
test_row <- function(index,matrix){
  test_data <- data.frame(
    value=as.numeric(matrix[index,]),
    group=cell_metadata$Infection)
  out <- wilcox.test(value~group,test_data)
  out$p.value
}

# Use vapply to apply the above funtion to all the genes
p_values <- vapply(seq(1,nrow(logcounts),1),test_row,FUN.VALUE = numeric(1),matrix=logcounts) # numeric(1) is to create a vector of length of 0
p_values


## Visualise a bar plot of the p-values
par(mfrow=c(2,3))
hist(p_values,main='p_values')
abline(v=0.05, col='red')


## Correct p-values for multiple testing. How many genes remain before and after multiple testing?
p_adjusted_1 <- p.adjust(p_values,method = 'BY')
hist(p_adjusted, main='BY')

p_adjusted_2 <- p.adjust(p_values,method = 'BH')
hist(p_adjusted, main='BH')


plot(p_values,p_adjusted_1)
abline(a=0,b=1)
abline(h=0.05,col='red')
abline(v=0.05,col='red')

plot(p_values,p_adjusted_2)
abline(a=0,b=1)
abline(h=0.05,col='red')
abline(v=0.05,col='red')

par(mfrow=c(1,1))

## Use gene_metadata.csv to get the gene name for the gene identifier associated with the smallest p-value



