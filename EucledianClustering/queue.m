function [q,no_of_points_in_this_cluster] = queue(two_d_data,cluster_assignment_to_points,index_of_unassigned_point,neighbor_distance,no_of_points_in_cluster,max_no_of_points_in_cluster)

no_of_points_in_this_cluster = no_of_points_in_cluster;
[l,b] = size (cluster_assignment_to_points);
q = zeros(l,1);
distance_matrix = ones(l,1);
distance_matrix = distance_matrix*realmax;
points_to_be_checked = find(cluster_assignment_to_points == 0);
no_of_points_to_be_checked = size(points_to_be_checked);
no_of_points_to_be_checked = no_of_points_to_be_checked(1,1);

i=0;
if(no_of_points_to_be_checked ~= 0)
    
    for k = 1:no_of_points_to_be_checked
        point_checking = points_to_be_checked(k);
        dist = distance(two_d_data(index_of_unassigned_point,:),two_d_data(point_checking,:));
        distance_matrix(point_checking,1) = dist;
        if(dist <= neighbor_distance)
            i = i+1;
            no_of_points_in_this_cluster = no_of_points_in_this_cluster+1;
            q(i,1) = point_checking;    
        end    
    end    
end 

if(i == 0)
    q = zeros(0,1);
else
    q = q(1:i,1);
    if(no_of_points_in_this_cluster>max_no_of_points_in_cluster)
       difference =  max_no_of_points_in_cluster - no_of_points_in_this_cluster;
       difference = i - difference;
       for k = 1:difference
          [number,position] = min( distance_matrix);
          number = number(1,1);
          position = position(1,1);
          q(k,1) = position;
          distance_matrix(position,1) = realmax;
       end 
       q = q(1:difference);
    end    
end    
