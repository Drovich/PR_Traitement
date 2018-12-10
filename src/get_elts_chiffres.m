function [elements, chiffres, plausibilites] = get_elts_chiffres(binary_code,n)

elements = 'AAAAAA';
chiffres = zeros(1,13);
plausibilites = zeros(1,13);
ensembleSignature=obtenirSignature(n);
for i=2:13
    if i <8    
      [elements(1,i-1) chiffres(1,i) plausibilites(1,i)] = get_elt_chiffre(binary_code(1,(3+7*(i-2))*n+1:(3+7*(i-1))*n-1+1),ensembleSignature, 30,n);
    else
      [elements(1,i-1) chiffres(1,i) plausibilites(1,i)] = get_elt_chiffre(binary_code(1,(3+5+7*(i-2))*n+1:(3+5+7*(i-1))*n-1+1),ensembleSignature, 30,n);
    end
end
chiffres(1,1)=get_premier_chiffre(elements(1, 1:6));
plausibilites(1,1)=sum(plausibilites)/12;




end




