function conc = indice_concordance(A_1, A_2, Poids)
    somme_Pk = 0;
    somme_Pl = sum(Poids);
    for i=1:size(Poids,2)
        if A_1(i) >= A_2(i)
            somme_Pk = somme_Pk + Poids(i);
        end
    end
    conc = somme_Pk/somme_Pl;
end