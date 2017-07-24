function normalized_data = normalize(data)

[rows_in_data,columns_in_data,width_of_data] = size(data);

normalized_data = zeros(rows_in_data,columns_in_data,width_of_data);
for i = 1:width_of_data
   B = data(:,:,i);
   normalized_data(:,:,i) = (B-min(B(:)))/(max(B(:)) - min(B(:)));
end    