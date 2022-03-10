%stocks

function [xStocks2, valeur] = stock_minimum(A,B,Aeq,Beq,fC)

    xStocks2= linprog(fC,A,B,Aeq,Beq,[0 0 0 0 0 0])
    valeur = fC*xStocks2
end