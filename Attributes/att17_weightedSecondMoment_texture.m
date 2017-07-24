function e = att17_weightedSecondMoment_texture(Neig)

% Co-ocurrence matrix in direction [2 0]
CM = graycomatrix(Neig,'Offset',[2 0]);

% computing entropy:
[M N] = size(CM);

e = 0;
for i = 1:M
    for j = 1:N
        e = e + i*j*CM(i,j);
    end
end

end

        


