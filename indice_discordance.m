<<<<<<< Updated upstream:indice_discordance.m
function disc = indice_discordance(A_1, A_2, echmax)
    liste_ecart = zeros(1,size(A_1,2));
    for i=1:size(A_1,2)
        ecart = A_2(:,i) - A_1(:,i);
        liste_ecart(1,i) = ecart;
    end
    maximum = max(liste_ecart);
    disc = maximum/echmax;
=======
%%%Fonction qui, à partir de deux lignes matricielles données du maximum de l'échelle
%choisie pour l'évaluation, permet d'obtenir leur indice de concordance.

%%%Entrée : Lignes A_1 et A_2, maximum de l'échelle choisie.

%%%Sortie : Indice de discordance.

function disc = indice_discordance(A_1, A_2, echmax)
    liste_ecart = zeros(1,size(A_1,2));
    for i=1:size(A_1,2)
        ecart = A_2(:,i) - A_1(:,i);
        liste_ecart(1,i) = ecart;
    end
    maximum = max(liste_ecart);
    disc = maximum/echmax;
>>>>>>> Stashed changes:analyse_multicritere/indice_discordance.m
end