function [graph] = merge_graph(graph,A,Vertex_of_graph)

[m,n] = size(A);
[r,c] = size(graph);

vertex1 = A(1:m-1,:);
vertex2 = A(m,:);
a = vertex1(m-1,1);
a = a(1,1);
%display(a);
vertex1 = find( Vertex_of_graph == a , 1);
vertex1 = vertex1(1,1);
vertex1 = rem(vertex1,r);
vertex1 = vertex1(1,1);
if(vertex1 == 0)
    vertex1 = r;
end    
vertex2 = find( Vertex_of_graph == vertex2(1,1) , 1);
vertex2 = vertex2(1,1);
vertex2 = rem(vertex2,r);
vertex2 = vertex2(1,1);
if(vertex2 == 0)
    vertex2 = r;
end    

for i = 1 : r
   
            dist1 = graph(i,vertex1);
            dist2 = graph(i,vertex2);
            dist = dist1 + dist2;
        
        graph(i,vertex1) = dist;
        graph(vertex1,i) = dist;
      
    
end  

%Vertex1 and Vertex2 have been merged. 
%Now removing the redundant vertex i.e. Vertex2

%Removing the row

graph = eliminate_row_from_a_vector_or_matrix(graph,vertex2);
graph = eliminate_column_from_a_vector_or_matrix(graph,vertex2);