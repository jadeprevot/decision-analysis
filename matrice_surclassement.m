<<<<<<< Updated upstream:matrice_surclassement.m
function mat_surcl = matrice_surclassement(Mat_Concordance, Mat_Discordance, seuil_conc, seuil_disc)
    mat_surcl = zeros(size(Mat_Concordance,1));
    for i=1:size(Mat_Concordance,1)
        for j=1:size(Mat_Concordance,2)
            if Mat_Concordance(i,j) >= seuil_conc && Mat_Discordance(i,j) <= seuil_disc
                mat_surcl(i,j) = 1;
            end
        end
    end
=======
%%%Fonction qui, à partir d'une matrice de concordance, d'une matrice de discordance, 
%et de seuils de concordance et de discordance choisis, permet d'obtenir une matrice 
%de surclassement.

%%%Entrée : Matrice de concordance, matrice de discordance, seuils de concordance et de discordance.

%%%Sortie : Matrice de surclassement.

function mat_surcl = matrice_surclassement(Mat_Concordance, Mat_Discordance, seuil_conc, seuil_disc)
    mat_surcl = zeros(size(Mat_Concordance,1));
    for i=1:size(Mat_Concordance,1)
        for j=1:size(Mat_Concordance,2)
            if Mat_Concordance(i,j) >= seuil_conc && Mat_Discordance(i,j) <= seuil_disc
                mat_surcl(i,j) = 1;
            end
        end
    end
>>>>>>> Stashed changes:analyse_multicritere/matrice_surclassement.m
end