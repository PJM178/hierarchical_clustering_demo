# Hierarchical Clustering Demo
# Petri Montonen 2021

# Loading necessary packages

library(NbClust)
library(scales)
library(dendextend)

rm(list=ls())
setwd("C:/Users/petri/Desktop/GitHub töitä/R/Hierarchical_clustering")

# Data loading and pre-processing

data = read.delim("predicate-matrix-continuous.txt", header = FALSE, sep = "")

# Check for missing values

any(is.na(data))
summary(data)

attributes = read.delim("predicates.txt", header = FALSE, sep = "")
attributes = attributes[2]

classes = read.delim("classes.txt", header = FALSE, sep = "")
classes = classes[2]

rownames(data) = classes[1:50,1]
colnames(data) = attributes[1:85,1]

# Complete method using euclidean distance

distmat=dist(data, method="euclidean")

tree=hclust(distmat, method="complete")

# Visualizing the tree

dend=as.dendrogram(tree)
plot(dend, ylab="Height of the Tree", main="Hierachical Clustering")

# Cutting the tree where it may make sense

# Methods determining the optimal number of bracnhes

silhouette_method=NbClust(data, distance = "euclidean", min.nc = 2, max.nc = 20,
                 method = "complete", index = "silhouette")
gap_method=NbClust(data, distance = "euclidean", min.nc = 2, max.nc = 20,
                 method = "complete", index = "gap")
ch_method=NbClust(data, distance = "euclidean", min.nc = 2, max.nc = 20,
                method = "complete", index = "ch")

par(mfrow=c(1,3))
plot(2:20, silhouette_method$All.index, type="o",col="blue", xlab="number of branches", ylab="Silhouette Value", main="Silhouette")
plot(2:20, gap_method$All.index, type="o",col="blue", xlab="number of branches", ylab="Gap Value", main="GAP Statistic")
plot(2:20, ch_method$All.index, type="o",col="blue", xlab="number of branches", ylab="CH Value", main="Calinski-Harabasz Index")

dend2 = cut(dend, h = 260)
par(mfrow=c(2,1))
plot(dend2$upper)
plot(dend, ylab="Height of Tree", main="Hierachical Clustering Example")
par(mfrow=c(1,1))

# Cutting the tree based on the visualization and methods

clustermember=cutree(tree, h = 260)
max(clustermember)

memberclasses = matrix(c(classes[1:50,1], clustermember), nrow=50, ncol=2)

# Visualizing the final tree

d1=color_branches(dend,k=12, groupLabels = TRUE)
plot(d1)

### EOF ###
