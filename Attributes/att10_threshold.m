function[threshold] = att10_threshold (Window)

n = size(Window);

k = 1;
n1 = (n(1)) * (n(1));
new_array = zeros(n1,1);
for i = 1:n(1)    
    for j = 1:n(1)
        new_array(k) = Window(i,j);
        k = k + 1;
    end    
end

xbar = mean(new_array);


threshold = 0;

for i = 1:n 
    threshold = threshold + (new_array(i) - xbar)^2;
end


threshold = 3/(n1-1) * sqrt(threshold);
