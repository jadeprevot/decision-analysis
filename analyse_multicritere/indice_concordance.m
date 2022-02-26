%%%Fonction qui, à partir de deux lignes matricielles données et des poids 
%associés à leurs différentes colonnes (critères), permet d'obtenir 
%leur indice de concordance.

%%%Entrée : Lignes A_1 et A_2, matrice des poids.

%%%Sortie : Indice de concordance.

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