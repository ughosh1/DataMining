function [vertex_no] = most_tightly_connected_vertex (A,V,graph,Vertex_of_graph)


vertex_no = 1;
size_of_V = size(V);
size_of_V = size_of_V(1,1);
size_of_A = size(A);
size_of_A = size_of_A(1,1);

size_of_vertex_of_graph = size(Vertex_of_graph);
size_of_vertex_of_graph = size_of_vertex_of_graph(1,1);
sum = 0;

for i = 1 : size_of_V
    sum = 0;
    point2 = V(i,1);
    point2 = find ( Vertex_of_graph == point2 , 1);
    point2 = point2(1,1);
    point2 = rem(point2,size_of_vertex_of_graph);
    point2 = point2(1,1);
    if(point2 == 0)
        point2 = size_of_vertex_of_graph;
    end    
    for j = 1 : size_of_A
       point1 = A(j,1);
       point1 = find ( Vertex_of_graph == point1 , 1);
       point1 = point1(1,1);
       point1 = rem(point1,size_of_vertex_of_graph);
       point1 = point1(1,1);
       if(point1 == 0)
           point1 = size_of_vertex_of_graph;
       end    
	   
       %%%%%%% Change when graph changes
       if ((graph(point1,point2)) ~= (0) )
          sum = sum +  (graph(point1,point2));
       end    
    end  
    
    if ( i== 1)
       distance_with_A = sum;
       vertex_no = i;
    else
        if(sum > distance_with_A)
            distance_with_A = sum;
            vertex_no = i;
        end    
    end    
end    