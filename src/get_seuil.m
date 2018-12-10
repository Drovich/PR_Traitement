function [threshold] = get_seuil(profil)
h=zeros(1,256);
for i=0:255
    h(1,i+1)=sum( profil==(i) );
end
    
w=zeros(1,256);
u=zeros(1,256);
i=0:255;
for k=1:256
   w(1,k) = sum(h(1,1:k))/sum(h);
   u(1,k) = sum(i(1,1:k).*h(1,1:k))/sum(h);
end

crit = w.*((u(255-1)-u)).^2 + ((1-w).*u).^2;
[indice, threshold] = max(crit);

if threshold ==256
    threshold =256/2;
end

end
