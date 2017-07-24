function[zero_crossings] = att14_zero_crossings (Window)


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


zero_crossings = 0;
for i =1:n1-1
    
    zero_crossings = zero_crossings + abs(sign(new_array(i+1) - sign(new_array(i))));
    
end

zero_crossings = .5*zero_crossings;
