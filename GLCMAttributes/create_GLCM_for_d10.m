function[matrix] = create_GLCM_for_d10(Window,no_of_discritizations)

matrix = zeros(no_of_discritizations,no_of_discritizations);
[no_of_rows,no_of_columns] = size(Window);
normalizing_factor = no_of_rows*(no_of_columns - 1);

for i = 1:no_of_discritizations
   for j = 1:no_of_discritizations
       
            value = 0;
            for r = 1:no_of_rows
                for c = 1:no_of_columns-1
                    
                    if((Window(r,c) == i) && (Window(r,c+1) == j))
                        value = value + 1;
                    end    
       
                end    
            end
            matrix(i,j) = value/normalizing_factor;
       
   end    
end