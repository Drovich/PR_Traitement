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

B = double(imread('../image/c11.jpg'));
% codes     = rgbtogray(B);

% imshow(uint8(B));

[D, T] = region_interet(B, 0.5, 20);


n=8;
[L,num] = bwlabel(D,n);
BAR=zeros(2,num);
u=[];
lambda=[];
% imshow(M.*uint8(B))
v=[];
alpha=1;
beta=0.01;
l=200;
hold on
for i=1:num
    v=zeros(2,2);
    L2 = L==i;
    [x,y] = tirer_autour_region(L2);
    [BAR(:,i) u lambda l] = vecteur_interet(L2);
    v(:,1)=ceil( BAR(:,i)-alpha*(l/2)*(u(:,1)+beta*u(:,2)) );
    v(:,2)=ceil( BAR(:,i)+alpha*(l/2)*(u(:,1)+beta*u(:,2)) );
    plot(BAR(2,i),BAR(1,i),'r*');
    plot(v(2,:),v(1,:),'r*');
end
hold off
BAR=ceil(BAR);
% figure, imshow(L*4);

