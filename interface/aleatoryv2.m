function [cle_controle, plausibilites, chiffres,nb_lancer]= aleatoryv2(B)
n=15; %% devrait être défini en fonction de la longeur de mon code bar sur l'image, et si possible impair !!
M=n*95;


%% Méthode 1

% % % Je pense que le problème c'est que c'est pas des vrai code bar déjà,
% % % après ça reste pas ouf, nottement un petit probleme dans le seuil quand
% % % l'image est trop "binaire" que j'ai régler en fixant abritrairement a
% % % 128 quand c'est le cas, sinon il est a 256...
% B = double(imread('../image/code_bar.png'));
% B = double(imread('../image/cod.jpg'));
% B = double(imread('../image/c1.jpg'));
% B = double(imread('../image/c3.jpg'));
% B = double(imread('../image/c5.jpg'));
% B = double(imread('../image/c6.jpg'));
% B = double(imread('../image/c11.jpg'));
% B = double(imread('../image/c12.jpg'));
% B = double(imread('../image/c10.jpg'));


codes     = rgbtogray(B);

imshow(uint8(codes));

[h,w] = size(codes)
nb_lancer=0;
plausibilites=zeros(1,13);
chiffres = zeros(1,13) -1;
seuil_plausi=0.9;
nb_lancer_partiel=0

[D, T] = region_interet(B, 0.5, 10);
MASK=uint8(D);
[zones num] = bwlabel(MASK);
%     x = 0;
%     y = 0;
% num
% for i=1:num
%     zone = (zones == i);
%     [xlim,ylim] = tirer_autour_region(zone);
%     seuil_plausi=0.9;
    
    
    while ( ( (plausibilites(1)<seuil_plausi) || (chiffres(1)<0) || cle_controle<0) )
        
        %     x = round(xlim(1) + (xlim(2)-xlim(1))*rand(2) );
        %     y = round(ylim(1) + (ylim(2)-ylim(1))*rand(2) );
        n_zone = floor(1 + (num)*rand(1,1) )
        zone = (zones == n_zone);
        [xlim,ylim] = tirer_autour_region(zone);
        [x y] = point_aleatoire(xlim,ylim, w, h);
        L=0;
        
        [xech, yech] = echantillonage(x,y,L);


        [profil] = extract_from_img(xech,yech,codes);

        [threshold] = get_seuil(profil);        % petit problème dans get_seuil, on obtient parfois 256 si l'image est trop "binaire"
        [binary_image] = seuillage(profil,threshold);

        [xcode,ycode] = extract_code(binary_image,xech,yech);
        % [xcode,ycode] = extract_code(profil,xech,yech);


        [xcode_ech, ycode_ech] = echantillonage(xcode,ycode,M);
        [profil_code] = extract_from_img(xcode_ech,ycode_ech,codes);

        [threshold2] = get_seuil(profil_code);

        [binary_code_image] = seuillage(profil_code,threshold2);

        [elements, chiffres, plausibilites,cle_controle] = get_elts_chiffres(binary_code_image, n);
        nb_lancer=nb_lancer+1;
        nb_lancer_partiel = nb_lancer_partiel+1;
        plausibilites(1);
        if nb_lancer_partiel>=10
            seuil_plausi=seuil_plausi-seuil_plausi/100;
            nb_lancer_partiel=0;

            imshow(uint8(B));
            hold on
    %         plot(x(1),y(1),'r*');
    %         plot(x(2),y(2),'r*');
            plot(xech,yech,'b*');

            hold off
            drawnow update ;  

            nb_lancer
            seuil_plausi
        end
    end

% end
% [binary_code] = code_img2code(binary_code_image,n);

% hold on
% plot([ones(1, floor(x(1))) profil]);
% plot(200+profil_code);
% hold off
% title('visualsiation profil')

% figure
% imshow(uint8(codes));
hold off
drawnow update ;
imshow(uint8(B));
hold on
% plot(xcode(1,1),ycode(1,1),'r*');
% plot(xcode(1,2),ycode(1,2),'r*');
%
%
plot(xcode_ech,ycode_ech,'b*');
 hold off
% 
% plot([ones(1, floor(x(1))) 20+binary_image*100]);
% plot([ones(1, xcode(1,1)) 200+binary_code_image*100]);
% hold off
title('visualsiation code bar')

end