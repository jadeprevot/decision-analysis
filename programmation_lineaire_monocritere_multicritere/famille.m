%commercials

function [xCommercial2, valeur] = famille(A,B,Aeq,Beq,fcommercial)
    xCommercial2= linprog(fcommercial,A,B,Aeq,Beq,[0 0 0 0 0 0])

    valeur = abs(sum(xCommercial2(1:3))-sum(xCommercial2(4:6)))
end