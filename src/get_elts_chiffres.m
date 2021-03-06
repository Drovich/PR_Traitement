function [elements, chiffres, plausibilites, cle_controle] = get_elts_chiffres(binary_code,n)

elements = 'AAAAAA';
chiffres = zeros(1,13);
plausibilites = zeros(1,13);
ensembleSignature=obtenirSignature(n);
for i=2:13
    if i <8    
      [elements(1,i-1) chiffres(1,i) plausibilites(1,i)] = get_elt_chiffre(binary_code(1,(3+7*(i-2))*n-1:(3+7*(i-1))*n-1-1),ensembleSignature, 30,n);
    else
      [elements(1,i-1) chiffres(1,i) plausibilites(1,i)] = get_elt_chiffre(binary_code(1,(3+5+7*(i-2))*n-1:(3+5+7*(i-1))*n-1-1),ensembleSignature, 30,n);
    end
end
chiffres(1,1)=get_premier_chiffre(elements(1, 1:6));
plausibilites(1,1)=sum(plausibilites)/12;

pair=0;
impair=0;
for i=1:6
    pair = pair+chiffres(1,2*i);
    impair = impair+chiffres(1,2*i-1);
end

% pai = mod(3*pair,10);
% impai = mod(impair,10);
cle_controle = -1;
if ( (10-chiffres(1,13))==(mod(3*pair+impair,10)) ) 
    cle_controle = 1;
end



end




