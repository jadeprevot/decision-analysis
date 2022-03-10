%comptable

function [xBenefice2, valeur] = benefice_maximum(A,B,Aeq,Beq,f)
    xBenefice2= linprog(f,A,B,Aeq,Beq,[0 0 0 0 0 0])
    %valeur=0
    valeur = -f*xBenefice2
end