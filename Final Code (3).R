# Code for Random Forest
install.packages("randomForest")
library(randomForest)
install.packages("igraph")
library(igraph)

data = read.csv("C:/Users/Atul/Desktop/Hadoop Big data project/DATASET/users_combined.csv")

s_d=sample(2633,1300) #1300 samples are taken from 2633 vector 

train_data= data[s_d, ]
test_data=data[-s_d, ]

# Running the random forest model
random = randomForest(result ~ ., train_data, ntree=100)
random

predict_data=predict(random,train_data)
predict_data

table(train_data[,5], predict_data)

mean(train_data[,5]==predict_data)

# Code for decision tree
install.packages("rpart.plot")
library(rpart.plot)

dim(train_data)
# Running the decision tree model
dtm<- rpart(result~., train_data, method="class")
dtm

rpart.plot(dtm,type=4,extra=101)
text(dtm)

#Code for the friends to followers graph

install.packages("igraph")
library(igraph)
account_followers = read.csv("C:/Users/Atul/Desktop/Hadoop Big data project/DATASET/final_graph_Data.csv")

abc <- data.frame(account_followers)

zxc <- graph.data.frame(abc, directed = FALSE)

E(zxc)$weight = abc$weight

plot(zxc, layout=layout.star,
     edge.width=E(zxc)$weight,
     edge.color="white",edge.arrow.size=5, edge.curved=.2,
     vertex.size=10, vertex.label.family="Arial Black" )

#Creating a gml file to import it to gephi and do visualization
write.graph(zxc, "graph.gml", format = "gml")

qwe<-plot(zxc,edge.width=E(zxc)$weight)


