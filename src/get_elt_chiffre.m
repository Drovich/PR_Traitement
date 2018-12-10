function [element, chiffre, plausibilite] = get_elt_chiffre(region7,ensembleSignature,position,n)

distance = 10*n;
dtemp = 0;
indice = 1;
region7;
for i=1:position
    dtemp =  sum( abs(region7-ensembleSignature(i,:)) );
    if(dtemp < distance)
        distance = dtemp;
        indice = i;
    end
end
distance;
ensembleSignature(indice,:);

if indice < 11 
    element = 'A';
end
if indice > 10 && indice <21
    element = 'B';
end
if indice > 20
    element = 'C';
end
chiffre = mod(indice-1,10);

% plausibilite = 1+log((7*n-distance)/7*n);
plausibilite = 1-distance/(7*n);

    
   
    
end
