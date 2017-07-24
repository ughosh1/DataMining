function two_d_data = convert_1d_data_to_2d(one_d_data,no_of_rows,no_of_columns)

size_of_1d_data = size(one_d_data);
two_d_data = zeros(no_of_rows,no_of_columns);

if(size_of_1d_data(1,1) ~= (no_of_rows*no_of_columns))
    fprintf('\n Number of rows and Number of columns of two diamentional data does not match the size of the one diamentional data.\nPlease Check !!!!!!!!\n');
else
 k = 1;
for i = 1:no_of_rows
    for j = 1:no_of_columns
        
        two_d_data(i,j) = one_d_data(k,1);
        k = k+1;
        
    end
end 
    
end

