# Hierarchical Clustering Demo

This is a demo of hierarchical clustering using R. The motivation behind this analysis is to simply demonstrate skills with R and the understanding of the underlying technique. The dataset is available here: https://cvml.ist.ac.at/AwA2/. The dataset was chosen because it was used in a course that I took, and that it's something else that the typical either car or the iris dataset. Hierarchical clustering can be used, for example, to find groups in a store customer data.

## The method and the data

Hierarchical clustering is a distance based method to partion the data. It can either be done top down or bottom up where you start with either one cluster with all the observations or with as many clusters as there are observations, respectively. Distance is usually measured as euclidean distance. Methods to partion the data are complete linkage, single linkage or average linkage. In this analysis top down (agglomerative) method is used along with complete linkage - after the shortest distance pair is formed, the distance between it and the remaining points in the distance matrix is determined by the max of pairwise distances between the remaining points in the matrix and the individual points in the cluster. It tends to produce more smaller clusters.

The dataset contains 85 features, such "big", "small", and "hairless", of 50 animals. The data is continous in nature though there is also binary version available. It contains no missing values.

## Results

The aim is to identify groups of animals that make sense based on their features. One thing crucial in clustering is determining the number of clusters. Too few clusters and the clusters don't represent the individuals well enough, and too many clusters and the clusters don't offer enough information - the extreme version of this is having as many clusters as there are observations. Figure 1. demonstrates the effect of choosing a cluster number; 5 clusters clumps together animals that clearly should not be together while, while the clusters make sense, 25 clusters has too many clusters to be a satisfactory clustering based on our needs, but there is no reason to necessarily have "tiger" be in its own cluster.

