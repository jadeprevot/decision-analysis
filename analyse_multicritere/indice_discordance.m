function disc = indice_discordance(A_1, A_2, echmax)
    liste_ecart = zeros(1,size(A_1,2));
    for i=1:size(A_1,2)
        ecart = A_2(:,i) - A_1(:,i);
        liste_ecart(1,i) = ecart;
    end
    maximum = max(liste_ecart);
    disc = maximum/echmax;
end