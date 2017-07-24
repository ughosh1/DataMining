function [dist] = distance(x1,x2)
dist = 0.0;
%----- Finding the Eucledian Distance between the two vectors x1 and x2 -----%
[m,no_of_elements] = size(x1);

sum = 0;
for i = 1:no_of_elements
   sum = sum + ( (x1(i) - x2(i)) * (x1(i) - x2(i)) );
end  
sum = double(sum);
dist = sqrt(sum);

