# Random Forest Regression

# Data Preprocessing

# Importing the dataset
dataset = read.csv('Position_Salaries.csv')
dataset = dataset[2:3]


# No splitting because the dataset is very small (just 10 lines)

# #Splitting the data into the Training and Test set
# #install.packages('caTools')
# library('caTools')
# set.seed(123)
# #primer parametro es y, la variable dependiente,
# #segundo el tamaño del training set. devuelve true si va a training set y false si va a test set
# split = sample.split(dataset$Purchased, SplitRatio=0.8) 
# training_set = subset(dataset, split == TRUE)
# test_set = subset(dataset, split == FALSE)


# Fitting Random Forest Regression to the dataset
# Create your regressor here
#install.packages('randomForest')
library(randomForest)
set.seed(1234)
regressor = randomForest(x = dataset[1],
                         y = dataset$Salary, #by $column we make it a vector, cause rF expects y to be a vector
                         ntree = 500)


# Visualising the Regression  Model results (for higher resolution and smoother curve)
library(ggplot2)
x_grid = seq(min(dataset$Level), max(dataset$Level), 0.01)
ggplot() + 
  geom_point(aes(x = dataset$Level, y = dataset$Salary),
             colour = 'red') +
  geom_line (aes(x = x_grid, y = predict(regressor, newdata = data.frame(Level = x_grid))),
             colour = 'blue') +
  ggtitle('Random Forest Regression') +
  xlab('Level')+
  ylab('Salary')


# Predicting a new result with Regression
y_pred = predict(regressor, data.frame(Level = 6.5))