function[standard_deviation] = att4_standard_deviation (Window)


n = size(Window);

k = 1;
n1 = (n(1)) * (n(1));
all_value_array = zeros(n1,1);
for i = 1:n(1)    
    for j = 1:n(1)
        all_value_array(k) = Window(i,j);
        k = k + 1;
    end    
end

standard_deviation = std(all_value_array);