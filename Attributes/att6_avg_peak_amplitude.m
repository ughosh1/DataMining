function[avg_peak_amplitude] = att6_avg_peak_amplitude (Window)

n = size(Window);
k = 1;
sum = 0;
no_of_peaks = 0;
n1 = (n(1)) * (n(1));
sorted_array = zeros(n1,1);
for i = 1:n(1)    
    for j = 1:n(1)
        sorted_array(k) = Window(i,j);
        k = k + 1;
    end    
end

for k = 1:n1
    if sorted_array(k) > 0
        sum = sum + sorted_array(k);
        no_of_peaks = no_of_peaks + 1;
        
    end
end   

avg_peak_amplitude = (sum \ no_of_peaks );
