function one_d_data = convert_2d_data_to_1d(two_d_data)

[no_of_rows,no_of_columns] = size(two_d_data);
size_of_1d_data = no_of_rows*no_of_columns;

one_d_data = zeros(size_of_1d_data,1);
k = 1;
for i = 1:no_of_rows
    for j = 1:no_of_columns
        
        one_d_data(k,1) = two_d_data(i,j);
        k = k+1;
        
    end
end    
