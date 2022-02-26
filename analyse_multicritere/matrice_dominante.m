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
end