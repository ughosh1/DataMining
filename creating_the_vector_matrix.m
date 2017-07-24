function[D_new] = creating_the_vector_matrix (no_of_inputs, no_of_traces, size_of_window, D, no_of_attributes, attributes )

sh = hilbert(D);
iph=atan2(imag(sh),real(sh));

%window represents the window for the normal attributes
%window1 represents the window for the GLCM attributes

%If the Energy, entropy, contrast or homogeneity (GLCM attributes) of the data are to be calculated,
%then discritize the data and calculate the appropriate window
if((ismember(19,attributes)) || (ismember(20,attributes)) || (ismember(21,attributes)) ||(ismember(22,attributes)) )
    flag = 0;
    while(flag == 0)
    size_of_Window1  = input('Enter the size of Window for calculating energy, entropy , contrast or homogeneity. Please enter an odd number \n');
        if((rem(size_of_Window1 , 2))== 0)
            fprintf('Please enter an odd number for the zize of window. \n');
        else
            flag = 1;
        end       
    end
     flag = 0;
    while(flag == 0)
    bits  = input('Enter the no. of bits you want to discritize the data for calculating energy, entropy , contrast or homogeneity. \nNo. of bits must be between 3 and 5. \n');
    if(bits< 3 || bits > 5)
        fprintf('Please Enter a number from 3 to 5. \n');
    else
        flag = 1;
    end       
    end
    
    no_of_discritizations = 2.^bits;
    
    max_of_data = max(max(D));
    min_of_data = min(min(D));
    discritizing_matrix = zeros((no_of_discritizations + 1),1);
    data_range = max_of_data - min_of_data;
    range_for_discritizing = data_range / no_of_discritizations;
    value = min_of_data;

    for i = 1 : (no_of_discritizations +1)
        discritizing_matrix(i,1) = value;
        value = value + range_for_discritizing;
        discritizing_matrix(i,1) = value;
    end    
    display(discritizing_matrix);
    %** Discritizing the original Data
    Discritized_D = zeros(no_of_inputs,no_of_traces);
    for i = 1 : no_of_inputs
        for j = 1 : no_of_traces
            for k = 1:no_of_discritizations +1
                
                if( k == no_of_discritizations+1)
                    Discritized_D(i,j) = k;
                    break;
                end
                
                if( (D(i,j) >= discritizing_matrix(k,1)) && (D(i,j) < discritizing_matrix(k+1,1)) )
                    Discritized_D(i,j) = k;
                    break;
                end
            end
        end
    end    
       
end    

%*************************************************************************%
no_of_elements_to_each_side_of_window = (size_of_window - 1)/2;
no_of_elements_to_each_side_of_window1 = (size_of_Window1 - 1)/2;
no_of_elements_to_each_side_of_window1 = round(no_of_elements_to_each_side_of_window1);
diff_bet_windows = no_of_elements_to_each_side_of_window1 - no_of_elements_to_each_side_of_window;
rows_of_D_new = no_of_inputs  - (size_of_window - 1);  %eliminating 2 *( (size_of_window - 1)/2) elements from the original window
columns_of_D_new = no_of_traces - (size_of_window - 1);
D_new = zeros(rows_of_D_new,columns_of_D_new,no_of_attributes);

for i = 1:rows_of_D_new
    for j = 1:columns_of_D_new
        
        
        Window = D (i:(i+size_of_window - 1), j:(j+size_of_window - 1));
        for k = 1:no_of_attributes 

        flag_for_GLCM = 0;    
        if((i<=no_of_elements_to_each_side_of_window1 +1) || (j<=no_of_elements_to_each_side_of_window1 + 1) || (i > (rows_of_D_new - no_of_elements_to_each_side_of_window1 +1) ) || ( j >(columns_of_D_new - no_of_elements_to_each_side_of_window1+1)) ) 
            flag_for_GLCM = 1;
        else
            Window1 = Discritized_D( (i-(no_of_elements_to_each_side_of_window1)):(i + no_of_elements_to_each_side_of_window1 ),(j-no_of_elements_to_each_side_of_window1 ):(j+no_of_elements_to_each_side_of_window1 ));
            
        end             
            
            if (k <= no_of_attributes -2)
                
                %*********** For GLCM Attributes ******%
                
            if ((attributes(k,1) ==19) ||(attributes(k,1) ==20) ||  (attributes(k,1) == 21) || (attributes(k,1) ==22))

                if (flag_for_GLCM == 1)
                    
                    value = min_of_data;
                    D_new(i,j,k) = value;                   
                else  
                    value = calculating_attributes_for_window1(Window1,attributes(k),no_of_discritizations);
                    D_new(i,j,k) = value;
                end
                continue;
            end
                
                %*****************************************%
                
                if (attributes(k,1) ==18)
                    value = iph(i,j);
                    D_new(i,j,k) = value;
                
                else
                    value = calculating_attributes_for_window(Window,attributes(k));
                    D_new(i,j,k) = value;
                end    
            else 
                 if (k == (no_of_attributes -1))
                        value = i;
                        D_new(i,j,k) = value;
                 else
                        value = j;
                        D_new(i,j,k) = value;
                end     
            end              
            
         end
       
    end

end
