function booleen = dominee(A, A_1)
    booleen = false;
    entier = 0;
    for i=1:size(A,1)
        disp('i=');
        disp(i);
        compteur = 0;
        for j=1:size(A,2)
            disp('j=');
            disp(j);
            if A_1(1,j) <= A(i,j)
                compteur = compteur + 1;
                %disp(compteur);
            end
        end
        if compteur == size(A,2)
            entier = entier + 1;
        end
    end
    if entier > 1
        booleen = true;
    end
    disp('booleen =');
    disp(booleen);
end