function [chaos] = att15_chaos_texture(Neig)

[m n] = size(Neig);

mn = m*n;

% compute mu_x
mu_x = 0;
for i = 1:m-1
    for j = 1:n
        Dx = Neig(i+1,j) - Neig(i,j);
        mu_x = mu_x + Dx;
    end
end
mu_x = mu_x/(mn);

% compute mu_y
mu_y = 0;
for i = 1:m
    for j = 1:n-1
        Dy = Neig(i,j+1) - Neig(i,j);
        mu_y = mu_y + Dy;
    end
end
mu_y = mu_y/(mn);

C = zeros(2,2);
for i = 1:m-1
    for j = 1:n-1
        Dx = Neig(i+1,j) - Neig(i,j);
        Dy = Neig(i,j+1) - Neig(i,j);
        C(1,1) = C(1,1) + (Dx-mu_x)*(Dx-mu_x);
        C(1,2) = C(1,2) + (Dx-mu_x)*(Dy-mu_y);
        C(2,1) = C(1,2);
        C(2,2) = C(2,2) + (Dy-mu_y)*(Dy-mu_y);
    end
end


L = eig(C);
chaos = (L(2) - L(1))/(L(2)+L(1));


        


