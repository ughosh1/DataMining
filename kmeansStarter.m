function [] = kmeansStarter(D_new , attributes , no_of_attributes , total_data_points , no_of_clusters)

%%%%%----- K means applied for segmentation -----%%%%%
% Modifying the data to be usable for kmeans %
Data_for_kmeans = zeros(total_data_points , no_of_attributes );
Data_for_kmeans = convertData_for_kmean_matrix (D_new);

% Aplying kmeans :

 %1. selfWritten kmeans :
 result = my_kmeans(Data_for_kmeans , no_of_clusters); 

 % 2. Original kmeans in matlab
%result = kmeans(Data_for_kmeans , 50);

% Data is mapped back for plotting
data_for_mapping = mapping_back_kmeanresult_for_plotting (result, D_new);



%%%%%----- Plotting the data -----%%%%%
[M,N] = size(data_for_mapping);
[x,y] = meshgrid(1:N, 1:M);
meshc(x,y,data_for_mapping);
%plotMatrix(data_for_mapping);
%plot(x,y,data_for_mapping);

%result = kmeans
%plot(D);

