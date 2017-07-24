function [D_new , attributes , no_of_attributes , total_data_points , no_of_inputs , no_of_traces] = preprocessing(D , size_of_window)

%%%%%----- Finding the size of the data received -----%%%%%
[no_of_inputs,no_of_traces] = size(D);

total_data_points = no_of_inputs * no_of_traces ;


%%%%%----- Input of the attributes we want to calculate is taken and processed -----%%%%%

attributes = take_input_of_attribute_choice();
no_of_attributes_index = size(attributes);
no_of_attributes = no_of_attributes_index(1) + 2; % The extra two attribtes represent the 2 attributes which contain valyes of the x and y axis
%The x and y axis values are also considered as attribtes to give spatial co-ordinates some importance. %
%i.e. with these attributes among 2 pairs of points a pair of point which are closer to eachother will be considered more similar to each other than %
%pair of attributes which have the same values but are spatially further away from each other%
 
 
%%%%%----- Making the window move and calculating the attributes and building the matrix D_new -----%%%%%
D_new = creating_the_vector_matrix (no_of_inputs, no_of_traces, size_of_window, D, no_of_attributes,attributes);     

