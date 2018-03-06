##### Machine Learning #####
library(lattice)
library(ggplot2)
library(MASS)
library(formatR)
library(highlight)
library(xtable)
library(dplyr)
# classfication
library(e1071) # SVM
library(ElemStatLearn)
library(ISLR)
library(klaR)
library(caret)
library(caretEnsemble)
library(class)
library(nnet)
library(rattle)
library(rpart)
library(rpart.plot)
library(rpart.utils)
library(rpartitions)
library(rpartScore)
library(randomForest)
library(randomForest.ddR)
library(randomForestSRC)
library(gbm)
library(ROCR)
### data partition(資料分割) ###
data(iris)
set.seed(500)
inTrain <- createDataPartition(y=iris$Species,
                               p=0.7, list=FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]
dim(training)
dim(testing)
##### clustering #####
### K-means / On-Line K-means(線上K均值法) ### 
# cluster
data(iris)
set.seed(500)
inTrain <- createDataPartition(y=iris$Species,
                               p=0.7, list=FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]
dim(training)
dim(testing)
# cluster with k-means
kMeans1 <- kmeans(subset(training, select=-c(Species)), centers=3)
training$clusters <- as.factor(kMeans1$cluster)
qplot(Petal.Width, Petal.Length, colour=clusters, data=training)
# Compare to real labels
table(kMeans1$cluster, training$Species)
par(mfrow = c(1,1),oma=c(0,0,0,0), mar=c(3, 3, 2, 0.5))
qplot(Petal.Width, Petal.Length, colour=clusters, data=training)
par(mfrow = c(1,1))
# Build predictor
modFit <- train(clusters ~., data=subset(training, select=-c(Species)), method="rpart")
# Apply on test
testClusterPred <- predict(modFit, testing) 
table(testClusterPred, testing$Species)
# Cluster = Average + Euclidean Distance
data(iris)
set.seed(500)
inTrain <- createDataPartition(y=iris$Species,
                               p=0.7, list=FALSE)
training <- iris[inTrain,]
testing <- iris[-inTrain,]
dim(training)
dim(testing)

iris.cl = training[,-c(5)]
iris.cl.av = hclust(dist(iris.cl), method="average")

par(mfrow = c(1,1),oma=c(0,0,0,0), mar=c(3, 3, 2, 0.5))

plot(iris.cl.av, xlab="")

par(mfrow = c(1,1))

# scale 
iris.cl.sc = scale(iris.cl)

iris.cl.av.sc = hclust(dist(iris.cl.sc), method="average")
plot(iris.cl.av.sc, xlab="")

par(mfrow = c(1,1))
### kmodes, k-medoid, PAM, CLARA ###
### Fuzzy C-Means (模糊C均值法) ###
### Quality Threshold Clustering (QT群集法) ###
### Hierarchical Clustering (階層式分群法) ###
### Self-Organizing Maps (SOM) (自我組織相關圖) ###
### Generated Association Plots (廣義相關圖) ###
##### classifying #####
### KNN ###
### LDA/QDA ###
### SIR(Sliced inverse regression LDA的推廣) ###
### Decision Tree ###
### Random Forest ###
### SVM ### kernel type
### Bagging ###
### Boosting ###
### XGboost ###
### ANN/RNN/CNN/DNN ###
