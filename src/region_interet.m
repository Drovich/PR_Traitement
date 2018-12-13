function [D, Txx] = region_interet(I, sigmaG, sigmaT)

I=rgbtogray(I);

% [X,Y]=meshgrid(-5:5);
[Xg,Yg]=meshgrid(ceil(-3*sigmaG):ceil(3*sigmaG));

% Hx=-X.*exp(-(X.^2+Y.^2)/(2*sigmaG^2))/(2*pi*sigmaG^4);
% Hy=-Y.*exp(-(X.^2+Y.^2)/(2*sigmaG^2))/(2*pi*sigmaG^4);
Hx=-Xg.*exp(-(Xg.^2+Yg.^2)/(2*sigmaG^2))/(2*pi*sigmaG^4);
Hy=-Yg.*exp(-(Xg.^2+Yg.^2)/(2*sigmaG^2))/(2*pi*sigmaG^4);
Ix=conv2(I,Hx,'same');
Iy=conv2(I,Hy,'same');
% G=(Gx.*Gx+Gy.*Gy).^0.5;

% 
% Hx = [-1 0 1; -2 0 2; -1 0 1];
% Hy = [-1 -2 -1; 0 0 0; 1 2 1];
% Ix=conv2(G,Hx,'same');
% Iy=conv2(G,Hy,'same');

[w h] = size(Ix)
for i=1:w
    for j=1:h
        M = (Ix(i,j).^2+Iy(i,j).^2).^0.5;
        Ix(i,j) = Ix(i,j)/M;
        Iy(i,j) = Iy(i,j)/M;
    end
end
% end
% M = (Ix.^2+Iy.^2).^0.5
% Ix=Ix/M;
% Iy=Iy/M;
% S=(Sx.*Sx+Sy.*Sy).^0.5;

% imshow(uint8((Ix.^2+Iy.^2).^0.5));
[Xt,Yt]=meshgrid(ceil(-3*sigmaT):ceil(3*sigmaT));

W = exp(-(Xt.^2+Yt.^2)/(2*sigmaT^2))/(2*pi*sigmaT^2)^0.5;


T=ones(2);
s = size(I);
Txx = conv2(Ix.*Ix,W,'same');
Txy = conv2(Ix.*Iy,W,'same');
Tyy = conv2(Iy.*Iy,W,'same');
% T = [conv2(W, Ix.*Ix)  conv2(W, Ix.*Iy) ; conv2(W, Ix.*Iy) conv2(W, Iy.*Iy)];

D = sqrt( (Txx-Tyy).^2 + 4*Txy.^2 ) ./ ( Txx+Tyy );




% imshow(uint8(G));
% figure
% imshow(uint8(D));
% figure
% imshow((D));
% figure
% imagesc(uint8(D));
% figure
% imagesc((D));

M=uint8(D);
% figure
% imshow(M*255);
% figure
imshow(uint8(I.*double(M)));


end