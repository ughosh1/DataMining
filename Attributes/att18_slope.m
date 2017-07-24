function[slope] = att18_slope (Window)

n = size(Window);
%n1 = (n(1)) * (n(1));
mid = (n(1) + 1) / 2;
slope = 0;
diff = 0;
for i = mid -1:mid + 1
    for j = mid -1:mid + 1
        if (mid > Window(i,j) )
            diff = mid - Window(i,j);
        else
            diff = Window(i,j) - diff;
        end
        
        if (diff > slope)
            slope = diff;
        end
        
    end
    
end
