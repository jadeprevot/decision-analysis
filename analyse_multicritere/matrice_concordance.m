%%%Fonction qui, à partir d'une matrice donnée et des poids associés à ses différentes colonnes
%(critères), permet d'obtenir sa matrice de concordance.

%%%Entrée : Matrice A, matrice des poids.

%%%Sortie : Matrice de concordance.

function mat_conc = matrice_concordance(A, Poids)
    mat_conc = zeros(size(A,1));
    for i=1:size(A,1)
        for j=1:size(A,1)
            if j~=i
                ind_conc = indice_concordance(A(i,:), A(j,:), Poids);
                mat_conc(i,j) = ind_conc;
            end
        end
    end
end