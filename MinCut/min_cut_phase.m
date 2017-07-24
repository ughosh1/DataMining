function [A] = min_cut_phase(graph,Vertex_of_graph,x_f)

%%%%%% Change when graph changes 
[no_of_elements,m] = size (graph);
V = Vertex_of_graph;
[v1,v2] = size(V);
A = sparse(zeros(v1,v2));


[row_where_foreground_point_is_found] = find ( V == x_f , 1);
row_where_foreground_point_is_found = row_where_foreground_point_is_found(1,1);
row_where_foreground_point_is_found = rem(row_where_foreground_point_is_found,no_of_elements);
row_where_foreground_point_is_found = row_where_foreground_point_is_found(1,1);
if(row_where_foreground_point_is_found == 0)
    row_where_foreground_point_is_found = no_of_elements;
end    
k = 1;

A(k,:) = V(row_where_foreground_point_is_found,:);
%Eliminating the element from V
V = eliminate_row_from_a_vector_or_matrix(V,row_where_foreground_point_is_found);
size_of_v = size(V);
size_of_v = size_of_v(1,1);

while((size_of_v > 0) && (V(1,1) ~= (-1)) )
    k = k+1;
    vertex_no = most_tightly_connected_vertex (A,V,graph,Vertex_of_graph);
    A(k,:) = V(vertex_no , :);
    V = eliminate_row_from_a_vector_or_matrix(V,vertex_no);
    
end    