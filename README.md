# DataMining
Application of clustering techniques in pattern recognition

Pattern recognition is the process of classifying input data based on "key" features. In this work I have used unsupervised learning approach to classify unlabeled input data into two classes.

Pre-processing : Feature extraction and Selection

Preprocessing of data is necessary to extract the important information from the data and to eliminate the unwanted information that might not help in classification or may hinder the results. Moreover, preprocessing of data is necessary to eliminate various noises in
the data. Data preprocessing is done by first extracting various attributes from the data. Again, selection of the best few attributes was necessary as some of these attributes might
not give us important information and hamper the results. In addition, elimination of some of these attributes was necessary to escape the curse of dimensionality. The attributes were selected according to their strength of class separability.

Feature Extraction

Raw data does not always give good and accurate results

Extraction of attributes are necessary to capture important information 

19 Attributes were Extracted


Clustering techniques

After pre-processing, I explored the data with different clustering techniques. Clustering is partitioning a group of entities (data points) into different groups (clusters)
such that the entities belonging to the same group are more similar compared to the entities in the other groups. The data points or entities can be a wide range of things depending on the field of study. Data points can be two-dimensional or three-
dimensional. By plotting on a graph, the data points are often represented in an image. The first and most challenging thing in clustering is to find the similarity measures
between entities, or simply to know when object1 is more similar to object2 than object3. Finding the similarity measure is relatively easier for data points or entities that can be
represented by numerical values and plotted in an n dimensional space. In that case, the simple concept of Euclidian distance can be used to define the degree of similarity. It
becomes complex when entities cannot be represented by a numerical value and hence cannot be plotted in an n dimensional space. Then, I needed to find a way to represent it in
some form of numerical value or find some other way to measure the similarity between two objects.

In this project I have experimented with four different clustering algorithms: the k-means algorithm, the expectation-maximization algorithm, the min-cut algorithm and the Euclidian clustering technique. I noticed that the efficiency and the
output results are different for different clustering techniques. Some form of similarity was noted between the k-means algorithm and the expectation maximization algorithm.
The k-means algorithm tries to find k different clusters. It initially takes k points as their means or centroids of the k clusters. Then it tries to assign all the points in the dataset to each of these k clusters. Then it updates the centroids of these clusters by finding the
average of the data points assigned to that particular cluster. These two steps are followed iteratively until convergence. The Expectation Maximization (EM) algorithm is similar to k-means algorithm, but
instead of doing a crisp assignment of data points to a cluster, it assigns the data points to clusters with a probability. This algorithm considers that the dataset is the result of
probability distributions which can be defined with some parameters. It iteratively tries to find the probability that each of the objects belong to these distributions and then tries to
find the new parameter estimates of these distributions. Iteration continues until convergence. The min-cut algorithm finds the cut in a graph representative of data points, so that the
cut (sum of the weights of the points the cut goes through) is minimum. This completely divides the entire dataset into two distinct classes. The fourth algorithm used is the Euclidian clustering algorithm. This algorithm uses a
simple approach. It considers a point and then finds its neighbors (two points are neighbors if their distance is below a mentioned threshold) and assigns all of them to a
particular cluster. It then considers the neighbors of the neighbors and assigns them to the previous cluster. This is done until a threshold (number of points that can be in a cluster)
is reached. After which a new point which is not assigned to any cluster is considered and the same steps are repeated.

