%******Contraintes initiales*******%
A=[18 5 0 5 0 10; 17 2 12 15 7 12; 8 1 11 0 10 25; 2 10 5 4 13 7; 15 0 8 7 10 15; 5 5 3 12 8 6; 13 3 5 8 10 7; 1 2 1 2 0 4; 2 1 1 5 2 1; 1 1 3 2 2 0];
B = [4800 4800 4800 4800 4800 4800 4800 400 900 500];

%*********Atelier********%
fAtelier=[-1 -1 -1 -1 -1 -1]
[xAtelier,nbMaxAtelier] = nombre_produit_atelier(A,B,[],[],fAtelier);

%*******Comptable********%

%****Calcul du cout de production d'un produit****

%Prix de production d'un produit produit pour les matières premières
QtePremier=[1 2 1 2 0 4; 2 1 1 5 2 1; 1 1 3 2 2 0];
PrixPremier=[2 4 1];
CoutMatiere=PrixPremier*QtePremier;

%Prix de production d'un produit pour les machines

tmpsMachine =[18 17 8 2 15 5 13; 5 2 1 10 0 5 3; 0 12 11 5 8 3 5; 5 15 0 4 7 12 8; 0 7 10 13 10 8 10; 10 12 25 7 15 6 7];
coutMachine =[4; 3; 1; 4; 2; 3; 1]/60;

CoutProduit=tmpsMachine*coutMachine;

%Cout total de production d'un produit

PrixTotProduit=CoutMatiere'+CoutProduit;

%Critère
PrixVente=[22 30 45 45 25 40];
Benefice=PrixVente-PrixTotProduit';

fComptable=-Benefice;

[xBenefice,beneficeMax] = benefice_maximum(A,B,[],[],fComptable);

%*****Stock*****%
%----- Volume optimal en fonction des critères de Prodcution ou de Benefice ------
pourcentages = [];
prod = [];
benef = [];
for p=0:0.01:1
     pourcentages  = [pourcentages p*100];
     [prod,xprod]= volume_production(A, B, p);
     [benef,xbenef] = volume_benefice(A, B, p);
     if p==0.80
        xbenef1=xbenef;
        xprod1 = xprod;
     end
end

plot(pourcentages, benef, pourcentages, prod);
title('Volume optimal dans le stock suivant les contraintes de Production ou de Bénéfice');
legend('Suivant le bénéfice','Suivant la prodcution');
xlabel('Pourcentage')
ylabel('Volume')
xtickformat('percentage');

%*******Personnel*******
tmpsMach13 = [26 6 11 5 10 35];
fPersonnel=tmpsMach13;
xPersonnel1 = linprog(fPersonnel,A,B,[],[],[0 0 0 0 0 0]);


%Rajout de la contrainte de taux de production P en maximisant le nombre de
%produit fabriqués

APersonnel=[18 5 0 5 0 10; 17 2 12 15 7 12; 8 1 11 0 10 25; 2 10 5 4 13 7; 15 0 8 7 10 15; 5 5 3 12 8 6; 13 3 5 8 10 7; 1 2 1 2 0 4; 2 1 1 5 2 1; 1 1 3 2 2 0;-1 -1 -1 -1 -1 -1];
tmpsMach=ones(1,100);
for p=1:100
    val = -p*408.77/100;
    BPersonnel = [4800 4800 4800 4800 4800 4800 4800 400 900 500 val];
    xPersonnel2(:,p)= linprog(fPersonnel,APersonnel,BPersonnel,[],[],[0 0 0 0 0 0]);
    tmpsMach(1,p)= tmpsMach13*xPersonnel2(:,p);
end

graph = plot(tmpsMach);
xlabel('taux de production en pourcentage')
ylabel('Temps minimal passé sur les machines 1 et 3 en min')
title('Temps minimal passé sur les machines 1 et 3 en fonction du taux de production')


%Rajout de la contrainte de taux de production P en maximisant le bénéfice
APersonnel3 = [18 5 0 5 0 10; 17 2 12 15 7 12; 8 1 11 0 10 25; 2 10 5 4 13 7; 15 0 8 7 10 15; 5 5 3 12 8 6; 13 3 5 8 10 7; 1 2 1 2 0 4; 2 1 1 5 2 1; 1 1 3 2 2 0;-Benefice];
for p=1:99
    p;
    val = -p*7185.078/100;
    BPersonnel3 = [4800 4800 4800 4800 4800 4800 4800 400 900 500 val];
    xPersonnel3(:,p)= linprog(fPersonnel,APersonnel3,BPersonnel3,[],[],[0 0 0 0 0 0]);
    tmpsMach3(1,p)= tmpsMach13*xPersonnel3(:,p);
end

graph = plot(tmpsMach3);
xlabel('taux du bénéfice en pourcentage')
ylabel('Temps minimal passé sur les machines 1 et 3 en min')
title('Temps minimal passé sur les machines 1 et 3 en fonction du taux du bénéfice')


%*****Commercial******%
%Equilibrer deux familles: ABC  et DEF 

%Il faut essayer de faire en sorte que les deux familles soit à peu près
%égales. Pour ce faire il faut satisfaire la contrainte -1<A+B+C-D-E-F<1 ce
%qui revient à ajouter deux ligne à la matrice A : 
AeqCommercial = [1 1 1 -1 -1 -1];
BeqCommercial = [0];
fCommercial=[-1 -1 -1 -1 -1 -1];

[xCommercial,equilibre]=famille(A,B,AeqCommercial,BeqCommercial,fCommercial);


%*******************Partie 2********************%

%solution multicritère
%Ajout d'une contrainte sur le bénéfice pour l'augmenter
%Cherche la solution optimale pour le critère des stocks
optimales=ones(5,1);
optimales(1,1)=408.7719;
optimales(2,1)=7185.078;
optimales(3,1)=1635.1;
optimales(4,1)=0;
optimales(5,1)=2669.5;

xproduits=ones(6,11);
valeurs=ones(5,11);
differences=ones(5,11);
normaliser=ones(6,11);
min_max=[183.7749 2595.939 408.8 252.77 5605.0733];

for p=77:84
    p;
    benefice2=p*7185.078/100;
    [xproduit2,val] = stock_minimum([A; -1 -1 -1 -1 -1 -1],[B -327.016],Benefice,[benefice2],[5 5 6 10 5 6]);
    valeurs(1,p-76)=benefice2;
    valeurs(2,p-76)=-fAtelier*xproduit2;
    valeurs(3,p-76)=val;
    valeurs(4,p-76)=abs(sum(xproduit2(1:3))-sum(xproduit2(4:6)))
    valeurs(5,p-76)=fPersonnel*xproduit2;
    xproduits(:,p-76)=xproduit2;

    differences(1,p-76)=abs(optimales(1,1)-valeurs(2,p-76));
    differences(2,p-76)=abs(optimales(2,1)-valeurs(1,p-76));
    differences(3,p-76)=abs(optimales(3,1)-valeurs(3,p-76));
    differences(4,p-76)=abs(optimales(4,1)-valeurs(4,p-76));
    differences(5,p-76)=abs(optimales(5,1)-valeurs(5,p-76));

    %normalisation
    for i=1:5
        normaliser(i,p-76)=differences(i,p-76)*100/min_max(1,i);
    end
    normaliser(6,p-76)= sum(normaliser(1:5,p-76))/5;
end


