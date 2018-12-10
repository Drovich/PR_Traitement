function [x_ech,y_ech,L] = echantillonage_code_barre(a1,a2,L, codes)


x1 = (a1(1));
y1 = (a2(1));

x2 = (a1(2));
y2 = (a2(2));
if L==0
    L = sqrt((x1-x2)^2+(y1-y2)^2);
end

if x1<x2
    x_ech=round(x1:abs(x1-x2)/L:x2-1/L);
else
    x_ech=round(x1:-abs(x1-x2)/L:x2-1/L);
end

if y1<y2
    y_ech=round(y1:abs(y1-y2)/L:y2-1/L);
else
	y_ech=round(y1:-abs(y1-y2)/L:y2-1/L);
end

for(i=min(x1,x2):abs(x1-x2)/L:max(x1,x2)-1/L)
    if(codes(round(i)) == 1)
        x1 = xech(i);
        y1 = yech(i);
    end
end

for(i=max(x1,x2)-1/L:-abs(x1-x2)/L:min(x1,x2))
    if(codes(round(i)) == 1)
        x2 = xech(i);
        y2 = yech(i);
    end
end



end