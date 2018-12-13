clear all;
close all;
clc;

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
% B = double(imread('../image/c10.jpg'));
% B = double(imread('../image/c11.jpg'));
B = double(imread('../image/c12.jpg'));
% codes     = rgbtogray(B);

imshow(uint8(B));

[D, T] = region_interet(B, 0.5, 25);
M=uint8(D);
% L=M*255;
% % figure
% % imshow(uint8(codes))
% % figure
% % imagesc(M);
% figure
% imshow(L);
% figure
% imshow(uint8(codes.*double(M)));

[x,y] = tirer_autour_region(M)



