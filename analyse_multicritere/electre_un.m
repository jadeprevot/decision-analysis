%%%Etape 1 : Matrice de jugements / Changement d'échelle

E = [6 5 4 5; 5 2 6 7; 4 3 2 5; 3 7 5 4; 1 7 2 9; 2 5 3 3; 5 4 2 9; 3 5 7 4]; %matrice jugements
Poids = [1 3.5 1.5 4]; %matrice poids

a1 = 0;
b1 = 10;
a2 = 3;
b2 = 7;
%y = x*(b2-a2)/(b1-a1)+(b1*a2-a1*b2)/(b1-a1);

col_1 = E(:,1);
col_3 = E(:,3);

col_1_ech = col_1 *(b2-a2)/(b1-a1)+(b1*a2-a1*b2)/(b1-a1);
col_3_ech = col_3 *(b2-a2)/(b1-a1)+(b1*a2-a1*b2)/(b1-a1);

E_ech = E;
E_ech(:,1) = col_1_ech;
E_ech(:,3) = col_3_ech;

%%%Etape 2 : Calcul des indices
E_ech_finale = matrice_dominante(E_ech);

%Matrice de concordance
M_C = matrice_concordance(E_ech_finale,Poids);

%Matrice de discordance
M_D = matrice_discordance(E_ech_finale, 10);

%%%Etape 3 : Choix des seuils de surclassement

%Matrice de surclassement
%Itération 1
M_S1 = matrice_surclassement(M_C, M_D, 0.85, 0.2);
%Itération 2
M_S2 = matrice_surclassement(M_C, M_D, 0.75, 0.3);
%Itération 3
M_S3 = matrice_surclassement(M_C, M_D, 0.65, 0.3);