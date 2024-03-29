# Hierarchical Clustering Demo

This is a demo of hierarchical clustering using R. The motivation behind this analysis is to simply demonstrate skills with R and the understanding of the underlying technique. The dataset is available here: https://cvml.ist.ac.at/AwA2/. The dataset was chosen because it was used in a course that I took, and that it's something else than the typical either the car or the iris dataset. Hierarchical clustering can be used, for example, to find groups in a store customer data.

## Methodology and data

Hierarchical clustering is a distance based method to partion the data. It can either be done top down or bottom up where you start with either one cluster with all the observations or with as many clusters as there are observations, respectively. Distance is usually measured as euclidean distance. Methods to partion the data are complete linkage, single linkage or average linkage. In this analysis top down (agglomerative) method is used along with complete linkage - after the shortest distance pair is formed, the distance between it and the remaining points in the distance matrix is determined by the max of pairwise distances between the remaining points in the matrix and the individual points in the cluster. It tends to produce more smaller clusters.

The dataset contains 85 features, such as "big", "small", and "hairless", of 50 animals. The data is continous in nature though there is also a binary version available. It contains no missing values. Predicates.txt contains the full feature list, classes.txt containt the names of the observations, and predicate-matrix-continuous.txt contains the numerical data associated with the classes.

## Results

The aim is to identify groups of animals that make sense based on their features. One thing crucial in clustering is determining the number of clusters. Too few clusters and the clusters don't represent the individuals well enough, and too many clusters and the clusters don't offer enough information - the extreme version of this is having as many clusters as there are observations. Figure 1. demonstrates the effect of choosing a cluster number; 5 clusters clumps together animals that clearly should not be together while, while the clusters make sense, 25 clusters has too many clusters to be a useful clustering, based on our needs.

![cluster_number](https://user-images.githubusercontent.com/91892495/150689421-212e429a-732a-4967-ae40-58ab1ac2a512.png)

**Figure 1. Choice of cluster numbers**

One method to figure out the cluster number, or branches in the case of hierarchical clustering, is to look at the dendrogram. However, this quickly becomes unwieldy as the number of observations increases, though the whole method works the best with a limited number of data in the first place. As such, there are several techniques to help in the choice. Figure 2. showcases three of these: Silhouette, Total Within Sum of Squares and Gap statistic.

![optimal_cluster_number](https://user-images.githubusercontent.com/91892495/150690072-79e16e08-82dd-4b46-a6bd-21d5b46c75c8.png)

**Figure 2. Silhouette, Total Within SUm of Squares and Gap statistic to determine the optimal cluster number**

Of course, the more branches there are the more accurate the clustering is, but it's possible to determine the optimal value based on several different metrics of which the demontrated three are only a few. In figure 2. the silhouette value would suggest 3 clusters. Howevery, looking at the dendrogram this is clearly too few clusters to have a meaningful clustering. Next best value is 12 clusters, which seems more reasonable. Total Within Smm of Square (TWSS) gives always a better value the more clusters there is, and there isn't a clear cutoff shown here. Gap statistic would suggest 14 clusters. Based on the visual analysis of the dendrogram and results of the three methods shown here, 12 clusters is chosen. Figure 3. visualizes the final tree along with the clusters.

![tree_12_clusters](https://user-images.githubusercontent.com/91892495/150690587-b31b4174-2890-45e6-96fc-bca2f4735796.png)

**Figure 3. Tree with 12 branches**

12 clusters seems to make sense for this data. For example, cluster 1 comprises of animals which live in water while cluster 12 comprises of primates. Cluster 11 (bat) is separate from cluster 12 while it would be a part of it if the tree was cut a little higher like it was with 5 clusters. One thing is that 12 clusters clumps wolf, fox, weasel, chihuahua, persian cat, siamese cat, dalmatian, german shepherd, and collier together whereas there could be more separation here. Then again, based on my limited knowledge, these seem to all belong into the _canis_ genus so it's expected that they share features. This also demonstrates that the number of clusters has a huge effect on how we interpret the data. Hierarchical clustering should not necessarily be used as a classification tool but it's a useful tool for data exploration.
