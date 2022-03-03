function [production,x] = volume_benefice(A_init, B_init, pourcentage)
    activite = [-1 -1 -1 -1 -1 -1];  
    A = [A_init; activite];
    contrainte_benefice = 225 * (-pourcentage);
    B = [B_init, contrainte_benefice];
    f = [5; 5; 6; 10; 5; 6]; % table 2 : pour chaque produit on calcule le volume utilisé (somme matières + 1)
    x = linprog(f,A,B,[],[],[0 0 0 0 0 0]);
    production = x' * f;
end