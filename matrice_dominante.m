<<<<<<< Updated upstream:matrice_dominante.m
function mat_dom = matrice_dominante(A)
    mat_dom = A;
    compteur = 0;
    for i=1:size(A,1)
        if dominee(A, A(i,:)) == true
            disp('Jenleve la ligne');
            disp(i);
            mat_dom(i-compteur,:) = [];
            compteur = compteur + 1;
        end
    end
=======
%%%Fonction permettant d'obtenir une matrice à laquelle les lignes dominées
%ont été supprimées, à partir d'une matrice donnée.

%%%Entrée : Matrice A.

%%%Sortie : Matrice à laquelle on a retiré les lignes dominées.

function mat_dom = matrice_dominante(A)
    mat_dom = A;
    compteur = 0;
    for i=1:size(A,1)
        if dominee(A, A(i,:)) == true
            mat_dom(i-compteur,:) = [];
            compteur = compteur + 1;
        end
    end
>>>>>>> Stashed changes:analyse_multicritere/matrice_dominante.m
end