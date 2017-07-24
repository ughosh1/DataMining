function[value_of_attribute] = GLCM_Energy(Window,no_of_discritizations)
value_of_attribute = 0;

%******  Calculating for d = 1,0  *******%

GLCM_for_d_10 = create_GLCM_for_d10(Window,no_of_discritizations);
[rows_of_GLCM_d10,columns_of_GLCM_d10] = size(GLCM_for_d_10);
energy1 = 0;

for i = 1:rows_of_GLCM_d10
    for j = 1:columns_of_GLCM_d10
        energy1 = energy1 + (GLCM_for_d_10(i,j) * GLCM_for_d_10(i,j));
    end
end    
value_of_attribute = energy1;
%***************************************%
%******  Calculating for d = 0,1  *******%

GLCM_for_d_01 = create_GLCM_for_d01(Window,no_of_discritizations);
[rows_of_GLCM_d01,columns_of_GLCM_d01] = size(GLCM_for_d_01);
energy2 = 0;

for i = 1:rows_of_GLCM_d01
    for j = 1:columns_of_GLCM_d01
        energy2 = energy2 + (GLCM_for_d_01(i,j) * GLCM_for_d_01(i,j));
    end
end    
if(energy2 > value_of_attribute)
    value_of_attribute = energy2;
end
%***************************************%

%******  Calculating for d = 1,1  *******%

GLCM_for_d_11 = create_GLCM_for_d11(Window,no_of_discritizations);
[rows_of_GLCM_d11,columns_of_GLCM_d11] = size(GLCM_for_d_11);
energy3 = 0;

for i = 1:rows_of_GLCM_d11
    for j = 1:columns_of_GLCM_d11
        energy3 = energy3 + (GLCM_for_d_11(i,j) * GLCM_for_d_11(i,j));
    end
end    
if(energy3 > value_of_attribute)
    value_of_attribute = energy3;
end
%***************************************%