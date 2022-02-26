E = [6 5 4 5; 5 2 6 7; 4 3 2 5; 3 7 5 4; 1 7 2 9; 2 5 3 3; 5 4 2 9; 3 5 7 4]; %matrice jugements
P = [1 4 3.5 1.5]; % matrice poids


%Ratios par rapport à a
for i=1:8
ratio(i)= 1;
    for j= 1:4
        ratio(i) = ratio(i)*power((E(i,j)/E(1,j)),P(j)); 
    end
end

%Pour calculer le ratio par rapport aux autres actions ai,
% il suffit de modifier E(1,j) par E(ai,j)
