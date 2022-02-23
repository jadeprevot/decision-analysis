function mat_disc = matrice_discordance(A, echmax)
    mat_disc = zeros(size(A,1));
    for i=1:size(A,1)
        for j=1:size(A,1)
            if j~=i
                ind_disc = indice_discordance(A(i,:), A(j,:), echmax);
                mat_disc(i,j) = ind_disc;
            end
        end
    end
end