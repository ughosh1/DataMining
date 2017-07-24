function [] = plot_according_to_EM_Algorithm(D_new , attr_no,attributes)

%%%%%----- Extract the required slab of 2d data and convert it to one diamentional matrix -----%%%%%
two_d_data = D_new(:,:,attr_no:attr_no);
one_d_data = convert_2d_data_to_1d(two_d_data);
[no_of_data,x] = size(one_d_data);

%%%%%----- Take the input for the number of desired clusters and create the weight matrix and the cluster detail matrix -----%%%%%
 no_of_clusters  = input('Enter the number of clusters \n');
 common_standard_deviation = 2;
 
 weight_matrix = ones(no_of_data , no_of_clusters);
 weight_matrix = weight_matrix / no_of_clusters;
 
 cluster_matrix = zeros(no_of_clusters,1);
 for i = 1: no_of_clusters
    cluster_matrix (i,1) = i;
 end
 mean_matrix = randsample(one_d_data,no_of_clusters);
 
 standard_deviation_matrix = ones(no_of_clusters,1);
 standard_deviation_matrix = standard_deviation_matrix*common_standard_deviation;
 
 cluster_matrix = [cluster_matrix mean_matrix standard_deviation_matrix];
 [no_of_rows_in_original_data,no_of_columns_in_original_data] = size (two_d_data);

 one_d_class_matrix = zeros(no_of_data,1);
 
 %%%%%----- Initializeng variables required -----%%%%%
 flag = 0;
 no_of_iterations = 0;
 min_threshold_for_mean_to_change = 0.01;
 threshold_for_number_of_iteration = 35;
 
 %%%%%----- Performing the EM Algorithm -----%%%%%
 denominator = 0;
 sum = 0;
 denominator = 0;
 difference = 0;
 fprintf('\nEntering while loop');
 while(flag == 0)
     cluster_matrix_new = zeros(no_of_clusters,1);
    %%%%%----- Step 1 : Expectation Step (Finding the probability that the point come from a particular distribution) -----%%%%%
    fprintf('\nStep1');
     for i = 1:no_of_data
        for j = 1: no_of_clusters
            for k = 1:no_of_clusters
                denominator = denominator + (weight_matrix(i,k) * probability(one_d_data(i,1),cluster_matrix(k,2) , cluster_matrix(k,3)));
            end 
            weight_matrix(i,j) = weight_matrix(i,j) *( probability(one_d_data(i,1),cluster_matrix(j,2) , cluster_matrix(j,3))) / denominator;
            
        end    
     end    
     
     %%%%%----- Step 2 : Maximizarion Step (Update the parameters i.e. find new estimates of the parameter that maximize the expected likelihood -----%%%%%
     fprintf('\nStep2');
     for j = 1:no_of_clusters
         sum = 0;
        for i = 1:no_of_data
            denominator = 0;
            for k = 1:no_of_data
                denominator = denominator + weight_matrix(k,j);
            end 
            sum = sum + (one_d_data(i,1) * weight_matrix(i,j) / denominator);
        end    
        cluster_matrix_new(j,2) = sum;
        cluster_matrix_new(j,3) = cluster_matrix(j,3);
     end  
     
     %%%%%----- Checking Stopping Criteria -----%%%%%
     fprintf('\nchecking stopping criteria');
     no_of_iterations = no_of_iterations + 1;
     display(no_of_iterations);
     if(no_of_iterations >  threshold_for_number_of_iteration)
         flag = 1;
         break;
     end    
     
     flag = 1;
     for j = 1:no_of_clusters
         difference = (cluster_matrix(j,2) - cluster_matrix_new(j,2));
         difference = abs(difference);
         if(difference > min_threshold_for_mean_to_change)
            flag = 0;
            fprintf('Stopping criteria not satisfied');
            break;
         end    
     end
     cluster_matrix = cluster_matrix_new;
 end    
 
 %%%%%----- Creating the class matrix -----%%%%%
 for i = 1 : no_of_data
     index = 1;
     weight = weight_matrix(i,1);
     for j = 1:no_of_clusters
         if(weight_matrix(i,j) > weight)
            weight = weight_matrix(i,j);
            index = j;
         end    
     end
     one_d_class_matrix (i,1) = index;
 end    
 %%%%%----- Transfering the 1d class matrix and concatinating it with the original data -----%%%%%
 two_d_class_matrix = convert_1d_data_to_2d(one_d_class_matrix,no_of_rows_in_original_data,no_of_columns_in_original_data);
 two_d_data_with_class_label = cat(3,two_d_data,two_d_class_matrix);
 
 %%%%%----- Plotting the data -----%%%%%

 %figure_no = attributes(attr_no);
 figure_no = 1;
 figure(figure_no); imagesc(two_d_class_matrix);
 
 [M,N] = size(two_d_class_matrix);
 [x,y] = meshgrid(1:N, 1:M);
meshc(x,y,data_for_mapping);
 

    
