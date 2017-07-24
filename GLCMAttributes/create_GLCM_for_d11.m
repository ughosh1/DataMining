function[matrix] = create_GLCM_for_d11(Window,no_of_discritizations)

matrix = zeros(no_of_discritizations,no_of_discritizations);
[no_of_rows,no_of_columns] = size(Window);
normalizing_factor = (no_of_rows - 1)*(no_of_columns - 1);

for i = 1:no_of_discritizations
   for j = 1:no_of_discritizations
       
            value = 0;
            for r = 1:no_of_rows -1
                for c = 1:no_of_columns-1
                    
                    if((Window(r,c) == i) && (Window(r+1,c+1) == j))
                        value = value + 1;
                    end    
       
                end    
            end
            matrix(i,j) = value/normalizing_factor;
       
   end    
end