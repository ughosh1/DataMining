function[result] = my_kmeans (Data_for_kmeans , no_of_clusters)

% Predefining a few parameters :
% threshold_of_iterations ==> number of maximum itterations that might happen
%minimum_threshold_of_distance_for_convergence ==> if the shift of the means are less than this distance, then it will terminate
threshold_of_iterations = 100;
iterations = 0;
minimum_threshold_of_distance_for_convergence = .000000002;

[no_of_data , no_of_attributes] = size(Data_for_kmeans);
no_of_attributes = no_of_attributes + 1;

%***** Creating the centroid matrix by initiliasing the first k elements as centroids ******%
centroid = Data_for_kmeans ;
rows_to_be_deleted = no_of_data - no_of_clusters;
centroid = centroid(1:end - rows_to_be_deleted,:); % deleting the extra columns copied in centroid from Data_for_kmeans

%****** Creating the extra column to determine the cluter each object belongs to *****%
extra_column = zeros(no_of_data,1);
Data_for_kmeans_new = Data_for_kmeans;
Data_for_kmeans_new = [Data_for_kmeans_new extra_column];

%***** Kmeans *******%
while 1
    
    % Assigining cluster to data
   centroid_new = zeros(no_of_attributes -1);
   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    parfor i = 1 : no_of_data
        
        temp_dist = 0;
        dist = find_distance(Data_for_kmeans , i , centroid , 1);
        cluster_number = 0;
        % Finding the closest centroid from the point
        for j = 1 : no_of_clusters
            temp_dist = find_distance(Data_for_kmeans , i , centroid , j);
            if(temp_dist <= dist)
                dist = temp_dist;
                cluster_number = j;
            end
            
        end   
        Data_for_kmeans_new(i,no_of_attributes) = cluster_number;
    end
    iterations = iterations + 1;
    %Checking whether the maximum number of itterations have crossed or not
    if(iterations > threshold_of_iterations)
        break;
    end
    
    % Computing the new centroid
    for j = 1:no_of_clusters
        sum = zeros(1,(no_of_attributes - 1));
        no_of_elements = 0;
        for i = 1:no_of_data
           if(Data_for_kmeans_new(i,no_of_attributes) == j)
              for k = 1: (no_of_attributes -1)
                 sum(1,k) = sum(1,k) + Data_for_kmeans_new(i,k);
              end    
              no_of_elements = no_of_elements + 1;
           end    
        end
        for k = 1:(no_of_attributes-1)
            centroid_new(j,k) = ( sum(1,k) / no_of_elements);
        end    
    end
    
    %Checking for convergence
    flag = 1;
    for i = 1:no_of_clusters
       check_dist = find_distance_for_points(centroid, centroid_new , i);
       if(check_dist > minimum_threshold_of_distance_for_convergence)
           flag = 0;
           break;
       end    
    end    
    if(flag == 0)
        centroid = centroid_new;
    else
        fprintf('\nkmeans have converged\n');
        break;
    end    
    
end

%***** Kmeans ends *****%


%***** Assigning the final result *****%
result = Data_for_kmeans_new (:,no_of_attributes);





