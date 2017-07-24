function [cut_phase_cost] = cut_phase_cost(A,graph,Vertex_of_graph)

[m,n] = size(A);
size_of_vertex_of_graph = size(Vertex_of_graph);
size_of_vertex_of_graph = size_of_vertex_of_graph(1,1);
vertex_of_t = find ( Vertex_of_graph == A(m,1) , 1);
vertex_of_t = vertex_of_t(1,1);
vertex_of_t = rem(vertex_of_t,size_of_vertex_of_graph);
vertex_of_t = vertex_of_t(1,1);
if(vertex_of_t == 0)
    vertex_of_t = size_of_vertex_of_graph;
end    


[no_of_points,x] = size(graph);
cut_phase_cost = 0;
for i = 1:no_of_points
   
    if(i ~= vertex_of_t)
        if(graph(vertex_of_t,i) ~= 0)
           cut_phase_cost = cut_phase_cost +  graph(vertex_of_t,i);
        end   
    end
    
end   
