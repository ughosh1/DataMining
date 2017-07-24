function[attributes] = take_input_of_attribute_choice ()




fprintf('\nThe following are the attributes you can use to segment the data\n');
fprintf('1. mean \n');
fprintf(' 2. median \n');
fprintf(' 3. variance \n');
fprintf(' 4. standard_deviation \n');
fprintf(' 5. reflection_intensity \n');
fprintf(' 6. avg_peak_amplitude \n');
fprintf(' 7. avg_valley_amplitude \n');
fprintf(' 8. avg_energy \n');
fprintf(' 9. curvelength \n');
fprintf(' 10. threshold \n');
fprintf(' 11. peaks \n');
fprintf(' 12. root_mean_square \n');
fprintf(' 13. avg_nonlinear_energy \n');
fprintf(' 14. zero_crossings \n');
fprintf(' 15. chaos_texture\n');
fprintf(' 16. contrast_texture\n');
fprintf(' 17. weightedSecondMoment_texture \n');
        attr  = input('Enter the attributes you want to use for kmeans segmentation (separated with "," ) \n','s');
        attr1 = textscan(attr, '%s' , 'Delimiter', ',');
         Nattr = length(attr1{1});
        
        attributes = zeros(Nattr,1);
        for i = 1:Nattr
            temp = attr1{1}(i);
            temp = temp{1};
            attributes(i) = str2num(temp);
        end