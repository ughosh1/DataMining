function [] = mainProgram(D)

%Preprocessing
size_of_window = 3;
[D_new , attributes , no_of_attributes , total_data_points , no_of_inputs , no_of_traces] = preprocessing(D,size_of_window);


%1. My kmeans : 
no_of_clusters = 100; % Change number of clusters as required
kmeansStarter(D_new , attributes , no_of_attributes , total_data_points , no_of_clusters)

% 2. EM Algorithm : 
plot_according_to_EM_Algorithm(D_new , 1,attributes);

%3. Min-Cut Algorithm :
min_cut_algo(D_new , no_of_inputs , no_of_traces);

% 4. Eucledian Cluster :
Euclidean_Cluster(D_new);


