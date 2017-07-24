function[median] = att2_median (Window)

n = size(Window);
k = 1;
n1 = (n(1)) * (n(1));
sorted_array = zeros(n1,1);
for i = 1:n(1)    
    for j = 1:n(1)
        sorted_array(k) = Window(i,j);
        k = k + 1;
    end    
end

sorted_array = sort(sorted_array);
med_point = (n1+1)/2;
median = sorted_array(med_point);
