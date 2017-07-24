function[dist] = find_distance (Data_for_kmeans , i , centroid , j)
dist = 0;
[n1,n2] = size(Data_for_kmeans);
sum = 0;
for k = 1:n2
    sum = sum + ( ( Data_for_kmeans(i,k) - centroid(j,k)) * ( Data_for_kmeans(i,k) - centroid(j,k)) );
    
end   

dist = sqrt(sum);