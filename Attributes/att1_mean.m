function[mean] = att1_mean (Window)

n = size(Window);
n1 = (n(1)) * (n(1));
sum = 0;
for i = 1:n(1)
    for j = 1:n(1)
        sum = sum + Window(i,j);
    end
    
end
mean = sum / n1;

