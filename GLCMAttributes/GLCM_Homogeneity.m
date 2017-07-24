function[value_of_attribute] = GLCM_Homogeneity(Window,no_of_discritizations)
value_of_attribute = 0;

%******  Calculating for d = 1,0  *******%

GLCM_for_d_10 = create_GLCM_for_d10(Window,no_of_discritizations);
[rows_of_GLCM_d10,columns_of_GLCM_d10] = size(GLCM_for_d_10);
entropy1 = 0;

for i = 1:rows_of_GLCM_d10
    for j = 1:columns_of_GLCM_d10
        entropy1 = entropy1 + ( GLCM_for_d_10(i,j)/ (1 + abs(i - j)) );
    end
end    
value_of_attribute = entropy1;
%***************************************%
%******  Calculating for d = 0,1  *******%

GLCM_for_d_01 = create_GLCM_for_d01(Window,no_of_discritizations);
[rows_of_GLCM_d01,columns_of_GLCM_d01] = size(GLCM_for_d_01);
entropy2 = 0;

for i = 1:rows_of_GLCM_d01
    for j = 1:columns_of_GLCM_d01
        entropy2 = entropy2 + ( GLCM_for_d_01(i,j)/ (1 + abs(i - j))  );
    end
end    
if(entropy2 > value_of_attribute)
    value_of_attribute = entropy2;
end
%***************************************%

%******  Calculating for d = 1,1  *******%

GLCM_for_d_11 = create_GLCM_for_d11(Window,no_of_discritizations);
[rows_of_GLCM_d11,columns_of_GLCM_d11] = size(GLCM_for_d_11);
entropy3 = 0;

for i = 1:rows_of_GLCM_d11
    for j = 1:columns_of_GLCM_d11
        entropy3 = entropy3 + ( GLCM_for_d_11(i,j)/ (1 + abs(i - j))  );
    end
end    
if(entropy3 > value_of_attribute)
    value_of_attribute = entropy3;
end

