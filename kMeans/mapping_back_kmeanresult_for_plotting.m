function[data_for_mapping] = mapping_back_kmeanresult_for_plotting (result_of_kmean, original_data)


n = size(original_data);
n1 = (n(1)) * (n(2));
s = size (result_of_kmean);
data_for_mapping = zeros (n(1) , n(2));
k = 0;  

for i = 1 : n(1)
   
  for j = 1 :n(2)
       
       k = k + 1; 
     data_for_mapping(i,j) =    result_of_kmean(k);
    
    
   end  
end  

