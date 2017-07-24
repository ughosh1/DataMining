function contr = att16_contrast_texture(Neig)

% Co-ocurrence matrix in direction [2 0]
CM = graycomatrix(Neig,'Offset',[2 0]);

% computing entropy:
[M N] = size(CM);

contr = 0;
for i = 1:M
    for j = 1:N
        contr = contr + (i-j)^2 *CM(i,j);
    end
end


end

        


