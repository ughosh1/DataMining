function[root_mean_square] = att12_root_mean_square (Window)

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



sigma = 0;

for i=1:n1
    
    sigma = sigma + new_array(i)^2;
    
end

root_mean_square = sqrt(sigma/n1);
