function[value_of_attribute] = calculating_attributes_for_window1 (Window,k,no_of_discritizations)
switch k
     case 19
        value_of_attribute = GLCM_Energy(Window,no_of_discritizations);
     case 20
        value_of_attribute = GLCM_Entropy(Window,no_of_discritizations);
     case 21
        value_of_attribute = GLCM_Contrast(Window,no_of_discritizations);
     case 22
        value_of_attribute = GLCM_Homogeneity(Window,no_of_discritizations);
     otherwise
        value_of_attribute = 0;
end