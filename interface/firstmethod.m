function [] = firstmethod(B)

%%

n=55; %% devrait être défini en fonction de la longeur de mon code bar sur l'image, et si possible impair !!
M=n*95;


%% Méthode 1

% % % Je pense que le problème c'est que c'est pas des vrai code bar déjà,
% % % après ça reste pas ouf, nottement un petit probleme dans le seuil quand
% % % l'image est trop "binaire" que j'ai régler en fixant abritrairement a
% % % 128 quand c'est le cas, sinon il est a 256...
% B = double(imread('../image/code_bar.png'));
% B = double(imread('../image/cod.jpg'));
% B = double(imread('../image/code1.jpg'));
% B = double(imread('../image/c1.jpg'));
% B = double(imread('../image/c3.jpg'));
% B = double(imread('../image/c5.jpg'));
% B = double(imread('../image/c6.jpg'));
% B = double(imread('../image/c8.jpg'));
% B = double(imread('../image/c10.jpg'));
% B = double(imread('../image/c11.jpg'));
% B = double(imread('../image/c12.jpg'));


% code_bar = rgbtogray(A);
codes     = rgbtogray(B);

imshow(uint8(codes));

[x,y]=ginput();
L=0;
[xech, yech, L] = echantillonage(x,y,L);


[profil] = extract_from_img(xech,yech,codes);

[threshold] = get_seuil(profil);        % petit problème dans get_seuil, on obtient parfois 256 si l'image est trop "binaire"
[binary_image] = seuillage(profil,threshold);

[xcode,ycode] = extract_code(binary_image,xech,yech);
% [xcode,ycode] = extract_code(profil,xech,yech);


[xcode_ech, ycode_ech, M] = echantillonage(xcode,ycode,M);
[profil_code] = extract_from_img(xcode_ech,ycode_ech,codes);

[threshold2] = get_seuil(profil_code);

[binary_code_image] = seuillage(profil_code,threshold2);

[elements, chiffres, plausibilites, cle_controle] = get_elts_chiffres(binary_code_image, n)


% [binary_code] = code_img2code(binary_code_image,n);

% hold on
% plot([ones(1, floor(x(1))) profil]);
% plot(200+profil_code);
% hold off
% title('visualsiation profil')
% 
% figure
% imshow(uint8(codes));
hold on
plot(xcode(1,1),ycode(1,1),'r*');
plot(xcode(1,2),ycode(1,2),'r*');


plot(xcode_ech,ycode_ech,'b*');

plot([ones(1, floor(x(1))) 20+binary_image*100]);
plot([ones(1, xcode(1,1)) 200+binary_code_image*100]);
hold off
title('visualsiation code bar')


end


