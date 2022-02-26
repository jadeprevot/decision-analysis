<<<<<<< Updated upstream:matrice_discordance.m
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
=======
%%%Fonction qui, à partir d'une matrice donnée et du maximum de l'échelle
%choisie pour l'évaluation, permet d'obtenir sa matrice de discordance.

%%%Entrée : Matrice A, maximum de l'échelle choisie.

%%%Sortie : Matrice de discordance.

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
>>>>>>> Stashed changes:analyse_multicritere/matrice_discordance.m
end