function [decoded_codebar] = decode_binary_codebar(binary_codebar, n)

j=3*n+7*n;
elements = zeros(1,12);
chiffre = zeros(1,12);
plausibilite = zeros(1,12);

for i =1:10
    [elements(1,i+1) chiffre(1,i+1) plausibilite(1,i+1)] = get_elt_chiffre(binary_codebar(1,j:j+7*n),ensembleSignature);
    j=j+7*n;
    if i==5 %%j/n == 45
        j = j + 5*n;
    end
end

end