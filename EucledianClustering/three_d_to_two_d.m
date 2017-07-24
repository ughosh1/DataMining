function [two_d_data] = three_d_to_two_d(three_d_data)

[rows,columns,width] = size(three_d_data);
no_of_data = rows*columns;
two_d_data = zeros(no_of_data,width);

l = 1;
for i = 1 : rows
   for j = 1: columns
          two_d_data(l,:) = three_d_data(i,j,:);
          l = l + 1;    
   end    
end    
