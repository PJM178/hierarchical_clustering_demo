# Hierarchical Clustering Demo

This is a demo of hierarchical clustering using R. The motivation behind this analysis is to simply demonstrate skills with R and the understanding of the underlying technique. The dataset is available here: https://cvml.ist.ac.at/AwA2/. The dataset was chosen because it was used in a course that I took, and that it's something else that the typical either car or the iris dataset. Hierarchical clustering can be used, for example, to find groups in a store customer data.

## The method and the data

Hierarchical clustering is a distance based method to partion the data. It can either be done top down or bottom up where you start with either one cluster with all the observations or with as many clusters as there are observations, respectively. Distance is usually measured as euclidean distance. Methods to partion the data are complete linkage, single linkage or average linkage. In this analysis top down (agglomerative) method is used along with complete linkage - after the shortest distance pair is formed, the distance between it and the remaining points in the distance matrix is determined by the max of pairwise distances between the remaining points in the matrix and the individual points in the cluster. It tends to produce more smaller clusters.

The dataset contains 85 features, such "big", "small", and "hairless", of 50 animals. The data is continous in nature though there is also binary version available. It contains no missing values.

## Results

The aim is to identify groups of animals that make sense based on their features. One thing crucial in clustering is determining the number of clusters. Too few clusters and the clusters don't represent the individuals well enough, and too many clusters and the clusters don't offer enough information - the extreme version of this is having as many clusters as there are observations. Figure 1. demonstrates the effect of choosing a cluster number; 5 clusters clumps together animals that clearly should not be together while, while the clusters make sense, 25 clusters has too many clusters to be a satisfactory clustering based on our needs, but there is no reason to necessarily have "tiger" be in its own cluster.

![cluster_number](https://user-images.githubusercontent.com/91892495/150689421-212e429a-732a-4967-ae40-58ab1ac2a512.png)

**Figure 1. Choice of cluster numbers**

One method to figure out the cluster number, or branches in the case of hierarchical clustering, is to look at the dendrogram. However, this quickly becomes unwieldy as the number of observations increases, though the whole method works the best with a limited number of data. As such, there are several techniques to help in the choice. Figure 2. showcases three of these: Silhouette, Total Within SUm of Squares and Gap statistic.

![optimal_cluster_number](https://user-images.githubusercontent.com/91892495/150690072-79e16e08-82dd-4b46-a6bd-21d5b46c75c8.png)

**Figure 2. Silhouette, Total Within SUm of Squares and Gap statistic to determine the optimal cluster number**

Of course, the more branches there are the more accurate the clustering is, but it's possible to determine the optimal value based on several different metrics. In figure 2. the silhouette value would suggest 3 clusters. Howevery, looking at the dendrogram this is clearly too few clusters to have a meaningful clustering. Next best value is 12 clusters, which seems more reasonable. Total Within Smm of Square (TWSS) gives always a better value the more clusters there is, and there isn't clear cutoff shown here. Gap statistic would suggest 14 clusters. Based on the visual analysis of the dendrogram and results of the three methods shown here, 12 clusters is chosen. 
