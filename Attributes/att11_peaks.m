function[peaks] = att11_peaks (Window)

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



peaks =  0;

for i=1:n1-2
    
    peaks = peaks + max(0,abs(sign(new_array(i+1) - new_array(i)) - sign(new_array(i+2) - new_array(i+1)) ));
    
end

peaks = .5*peaks;