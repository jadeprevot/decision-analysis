function mat_surcl = matrice_surclassement(Mat_Concordance, Mat_Discordance, seuil_conc, seuil_disc)
    mat_surcl = zeros(size(Mat_Concordance,1));
    for i=1:size(Mat_Concordance,1)
        for j=1:size(Mat_Concordance,2)
            if Mat_Concordance(i,j) >= seuil_conc && Mat_Discordance(i,j) <= seuil_disc
                mat_surcl(i,j) = 1;
            end
        end
    end
end