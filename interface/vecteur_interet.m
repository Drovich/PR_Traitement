function [BAR] = vecteur_interet(zone)
BAR=zeros(2,1);
nb=0
for j=[1:length(zone)]
    for k=[1:length(zone(1,:))]
        if zone(j,k) ==1
            BAR(1)=BAR(1)+j;
            BAR(2)=BAR(2)+k;
            a11 = a11 + j^2;
            a12 = a11 + k^2;
            nb=nb+1;
        end
    end
end
BAR=BAR/nb


end