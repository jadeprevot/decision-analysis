E = [6 5 4 5; 5 2 6 7; 4 3 2 5; 3 7 5 4; 1 7 2 9; 2 5 3 3; 5 4 2 9; 3 5 7 4]; %matrice jugements
P = [1.5 4 3.5 1]; % matrice des poids
moyenne_ponderee = (P * E')/10; % moyenne pondérée des propositions
