function [chiffre] = get_premier_chiffre(elements)

if(sum(elements == 'AAAAAA') == 6)
    chiffre = 0;
elseif(sum(elements == 'AABABB') == 6)
    chiffre = 1;
elseif(sum(elements == 'AABBAB') == 6)
    chiffre = 2;
elseif(sum(elements == 'AABBBA') == 6)
    chiffre = 3;
elseif(sum(elements == 'ABAABB') == 6)
    chiffre = 4;
elseif(sum(elements == 'ABBAAB') == 6)
    chiffre = 5;
elseif(sum(elements == 'ABBBAA') == 6)
    chiffre = 6;
elseif(sum(elements == 'ABABAB') == 6)
    chiffre = 7;
elseif(sum(elements == 'ABABBA') == 6)
    chiffre = 8;
elseif(sum(elements == 'ABBABA') == 6)
    chiffre = 9;
else
    chiffre = -1;
end

end