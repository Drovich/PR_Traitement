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
B = double(imread('../image/c11.jpg'));
% codes     = rgbtogray(B);

% imshow(uint8(B));

[D, T] = region_interet(B, 0.5, 20);
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
n=8;
[L,num] = bwlabel(M,n);
BAR=[]
% imshow(M.*uint8(B))
hold on
for i=1:num
    L2 = L==i;
    [x,y] = tirer_autour_region(L2);
    [BAR] = [BAR vecteur_interet(L2)]
    plot(BAR(2,i),BAR(1,i),'r*');
end
hold off
BAR=ceil(BAR);
figure, imshow(L*4);

