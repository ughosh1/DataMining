function[avg_nonlinear_energy] = att13_avg_nonlinear_energy (Window)

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


avg_nonlinear_energy = 0;

for i=2:n1-1
    
    avg_nonlinear_energy = avg_nonlinear_energy + new_array(i)^2 - new_array(i+1)*new_array(i-1);
end

avg_nonlinear_energy = 1/(n1-2) * avg_nonlinear_energy;

