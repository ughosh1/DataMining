function[curvelength] = att9_curvelength (Window)

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

curvelength = 0;
for i = 1:n1-1
    
    curvelength = curvelength + abs(new_array(i+1) - new_array(i));
    
end


