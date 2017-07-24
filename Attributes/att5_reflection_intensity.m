function[reflection_intensity] = att5_reflection_intensity (Window)

n = size(Window);
k = 1;
sum = 0;
n1 = (n(1)) * (n(1));
sorted_array = zeros(n1,1);
for i = 1:n(1)    
    for j = 1:n(1)
        sorted_array(k) = Window(i,j);
        k = k + 1;
    end    
end

for k = 1:n1

     sum = sum + abs(sorted_array(k));
        
end

reflection_intensity = sum \ n1;