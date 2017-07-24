function[] = Euclidean_Cluster(D_new)

D_new = D_new(4:end-1,4:end-1,1:end - 2);
[rows_in_Dnew,columns_in_Dnew,width] = size(D_new);

%%%%----- Normalizing the data-----%%%%%
D_new = normalize(D_new);

%%%%%----- Euclidean Clustering -----%%%%%

%Finding Neighbor 
%neighbor_distance = .02631;
neighbor_distance = .3;
max_no_of_points_in_cluster = 25;

%%%%%----- Euclidean Clustering -----%%%%%
two_d_data = three_d_to_two_d(D_new);
[length,width] = size(two_d_data);

cluster_assignment_to_points = zeros(length,1);
flag_for_unassigned_points = 1;
i = 0;
while(flag_for_unassigned_points)
    
    i = i+1;
    display(i);
    no_of_points_in_cluster = 0;
    index_of_unassigned_point = find( cluster_assignment_to_points == 0,1);
    no_of_points_in_cluster = no_of_points_in_cluster + 1;
    [Q,no_of_points_in_cluster] = queue(two_d_data,cluster_assignment_to_points,index_of_unassigned_point,neighbor_distance,no_of_points_in_cluster,max_no_of_points_in_cluster);
    size_of_q = size(Q);
    size_of_q = size_of_q(1,1);
    display(size_of_q);
    for k = 1:size_of_q
        point = Q(k);
        cluster_assignment_to_points(point) = i;
    end    
    while(size_of_q ~= 0 && no_of_points_in_cluster <= max_no_of_points_in_cluster)
        point = Q(1,1);
        size_of_q = size(Q);
        size_of_q = size_of_q(1,1);
        cluster_assignment_to_points(point) = i;
        if(size_of_q == 1)
            Q = zeros(0,1);
        else
            Q = Q(2:end,:);
        end    
        Q1 = queue(two_d_data,cluster_assignment_to_points,index_of_unassigned_point,neighbor_distance,no_of_points_in_cluster,max_no_of_points_in_cluster);
        Q = [Q;Q1];
        
        
        
        size_of_q = size(Q);
        size_of_q = size_of_q(1,1);
        no_of_points_in_cluster = no_of_points_in_cluster + size_of_q;
    end        




    flag_for_unassigned_points = ismember(0,cluster_assignment_to_points);
end

data_for_plotting = convert_1d_data_to_2d(cluster_assignment_to_points,rows_in_Dnew,columns_in_Dnew);
imagesc(data_for_plotting);

