function[kmeans_data_matrix] = convertData_for_kmean_matrix (data_with_attributes)

n = size(data_with_attributes);
n1 = (n(1)) * (n(2));


kmeans_data_matrix = zeros (n1 , n(3));

l = 0;

for i = 1:n(1)
   for j = 1 : n(2)
      l = l + 1;
       for k = 1 : n(3)
          
           kmeans_data_matrix (l , k) = data_with_attributes (i,j,k);
           
           
       end
   end 
end
