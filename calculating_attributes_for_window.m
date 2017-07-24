function[value_of_attribute] = calculating_attributes_for_window (Window,k)
switch k
    case 1
        value_of_attribute = att1_mean(Window);
    case 2
        value_of_attribute = att2_median (Window);
    case 3
        value_of_attribute = att3_variance (Window);
    case 4
        value_of_attribute = att4_standard_deviation (Window);
    case 5
        value_of_attribute = att5_reflection_intensity(Window);
    case 6
       value_of_attribute = att6_avg_peak_amplitude (Window);
     case 7
       value_of_attribute = att7_avg_valley_amplitude (Window);
    case 8
        value_of_attribute = att8_avg_energy (Window);
    case 9
       value_of_attribute = att9_curvelength (Window);
    case 10
        value_of_attribute = att10_threshold (Window);
    case 11
        value_of_attribute = att11_peaks (Window);
    case 12
        value_of_attribute = att12_root_mean_square (Window);
    case 13
        value_of_attribute = att13_avg_nonlinear_energy (Window);
    case 14
        value_of_attribute = att14_zero_crossings (Window);
    case 15
         value_of_attribute = att15_chaos_texture(Window);
    case 16 
        value_of_attribute = att16_contrast_texture(Window);
    case 17
        value_of_attribute = att17_weightedSecondMoment_texture(Window);
    case 18
        value_of_attribute = att18_slope(Window); 
        
    otherwise
        value_of_attribute = 0;
end