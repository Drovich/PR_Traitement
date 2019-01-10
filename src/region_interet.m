function [D, Txx] = region_interet(I, sigmaG, sigmaT)

I=rgbtogray(I);

% [X,Y]=meshgrid(-5:5);
[Xg,Yg]=meshgrid(ceil(-3*sigmaG):ceil(3*sigmaG));


Hx=-Xg.*exp(-(Xg.^2+Yg.^2)/(2*sigmaG^2))/(2*pi*sigmaG^4);
Hy=-Yg.*exp(-(Xg.^2+Yg.^2)/(2*sigmaG^2))/(2*pi*sigmaG^4);
Ix=conv2(I,Hx,'same');
Iy=conv2(I,Hy,'same');

[h w] = size(Ix);
for i=1:h
    for j=1:w
        M = (Ix(i,j).^2+Iy(i,j).^2).^0.5;
        Ix(i,j) = Ix(i,j)/M;
        Iy(i,j) = Iy(i,j)/M;
    end
end
[Xt,Yt]=meshgrid(ceil(-3*sigmaT):ceil(3*sigmaT));

W = exp(-(Xt.^2+Yt.^2)/(2*sigmaT^2))/(2*pi*sigmaT^2)^0.5;


T=ones(2);
s = size(I);
Txx = conv2(Ix.*Ix,W,'same');
Txy = conv2(Ix.*Iy,W,'same');
Tyy = conv2(Iy.*Iy,W,'same');
% T = [conv2(W, Ix.*Ix)  conv2(W, Ix.*Iy) ; conv2(W, Ix.*Iy) conv2(W, Iy.*Iy)];

D = sqrt( (Txx-Tyy).^2 + 4*Txy.^2 ) ./ ( Txx+Tyy );

% threshold=mean(mean(D));
threshold=0.5;
for i =1:length(I)
    threshold=threshold+get_seuil(I(i,:));
end
threshold=threshold/length(I)

D=255*uint8((D*255)>threshold);
% D=255*uint8(D>threshold);

figure, 
imshow(D);

% figure
% imshow(uint8(I.*double(M)));


end