%atelier

function [xAtelier2, valeur] = nombre_produit_atelier(A,B,Aeq,Beq,fAtelier)
    
    xAtelier2= linprog(fAtelier,A,B,Aeq,Beq,[0 0 0 0 0 0])

    valeur = sum(xAtelier2)
end

    

