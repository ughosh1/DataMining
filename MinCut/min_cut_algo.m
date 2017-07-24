function [] = min_cut_algo(D_new , no_of_inputs , no_of_traces)

%%%%%----- APPLYING MIN CUR+T ALGORITHM TO THE DATA -----%%%%%

%%%%%%%%%%%%%%%%%%%%%%% TO BE DELETED %%%%%%%%%%%%%%%%%%
graph = sparse(zeros(total_data_points,total_data_points));

%%% Need to take user input %%%
% Initializing k for k nearest neighbor algorithm 
k_for_knn = 5;
% Initializing The foreground
%x_f = 250;
%y_f = 90;

%Temporary x and y
%x_f = 250-100;
%y_f = 90;
x_f = 5;
y_f = 5;
toc
%Initializing the graph and converting the data from a three diamentional data to a two diamentional data 
two_d_data = three_d_to_two_d(D_new);
%graph = ones(total_data_points,total_data_points);
%graph = graph * (-1);
%graph = sparse(zeros(total_data_points,total_data_points));
neigrest_neighbor = 0;
distance_matrix_for_point = zeros(total_data_points,2);

[rows,columns] = size(D);
fore_ground_point = (columns * (y_f -1)) + x_f ;
display(x_f);
display(y_f);
%Filling up the graph
for i = 1: total_data_points
    distance_matrix_for_point = zeros(total_data_points,2);
    
    for j = 1 : total_data_points
            distance_matrix_for_point(j,1) = j;
            x1 = two_d_data(i,1:end);
            y1 = two_d_data(j,1:end);
            z = distance(x1,y1);
            distance_matrix_for_point(j,2) = z;
    end

    distance_matrix_for_point = sortrows(distance_matrix_for_point,2);
    distance_matrix_for_point = flipdim(distance_matrix_for_point,1);

    %Filling up the ith row of the graph
    for k = 1 : k_for_knn
        neigrest_neighbor = distance_matrix_for_point(k,1);
        graph(i,neigrest_neighbor) = distance_matrix_for_point (k,2);
        %Making the graph a biderectional graph
        graph(neigrest_neighbor , i) = distance_matrix_for_point (k,2);
    end    
    
end

initial_elements_of_graph = [1:total_data_points];
add_to_innitial_points = sparse(zeros(total_data_points, (total_data_points - 1)));

initial_elements_of_graph = transpose(initial_elements_of_graph);
initial_elements_of_graph = [initial_elements_of_graph , add_to_innitial_points];


Vertex_of_graph = initial_elements_of_graph;

min_cut_graph = graph;
vertex_of_min_cut_graph = Vertex_of_graph;
A_of_min_cut_graph = Vertex_of_graph;
list_of_verteces_not_merged = 0;


% Implying the min cut based algorithm

mincut = realmax;
size_of_vertex_of_graph = size(Vertex_of_graph);
size_of_vertex_of_graph = size_of_vertex_of_graph(1,1);
while(size_of_vertex_of_graph > 1)
    
    tic
    A = min_cut_phase(graph,Vertex_of_graph,fore_ground_point);
    s_t_phase_cut_cost = cut_phase_cost(A,graph,Vertex_of_graph);
    if(s_t_phase_cut_cost < mincut)
       mincut =  s_t_phase_cut_cost;
       min_cut_graph = graph;
       vertex_of_min_cut_graph = Vertex_of_graph;
       A_of_min_cut_graph = A;
    end
    
    %Merging the graph step
    graph = merge_graph(graph,A,Vertex_of_graph);
    Vertex_of_graph = new_vertex_of_graph(A,Vertex_of_graph);
    
    
    size_of_vertex_of_graph = size(Vertex_of_graph);
    size_of_vertex_of_graph = size_of_vertex_of_graph(1,1);
  toc  
end    
    
%Plotting the graph found by min cut algorithm

one_d_data = zeros(total_data_points,1);
[s1,s2] = size(vertex_of_min_cut_graph);
[m,n] = size(A_of_min_cut_graph);
vertex2 = A_of_min_cut_graph(m,:);

[r,c] = size(min_cut_graph);
vertex2 = find( vertex_of_min_cut_graph == vertex2(1,1) , 1);
vertex2 = vertex2(1,1);
vertex2 = rem(vertex2,r);
vertex2 = vertex2(1,1);
if(vertex2 == 0)
    vertex2 = r;
end    



    for j = 1:s2
        
        if(vertex_of_min_cut_graph(vertex2,j) ~=0)
            one_d_data(vertex_of_min_cut_graph(vertex2,j),1) = 1;
        end
    end


two_d_data = convert_1d_data_to_2d(one_d_data,no_of_inputs,no_of_traces);

imagesc(two_d_data);

    
    
    
    
    