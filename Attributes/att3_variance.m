function[variance] = att3_variance (Window)


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

variance = var(all_value_array);

