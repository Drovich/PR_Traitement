function [x_ech,y_ech] = echantillonage(a1,a2,L)
x1 = (a1(1)); y1 = (a2(1)); x2 = (a1(2)); y2 = (a2(2));
if x1==x2
    x2=x1-1;
    if x2==0
        x2=2;
    end
end
if y1==y2
    y2=y1-1;
    if y2==0
        y2=2;
    end
end

if L==0
    L = sqrt((x1-x2)^2+(y1-y2)^2);
end

if x1<x2
    x_ech=floor(x1:abs(x1-x2)/L:x2);
elseif x1>x2
    x_ech=floor(x1:-abs(x1-x2)/L:x2);
end

if y1<y2
    y_ech=round(y1:abs(y1-y2)/L:y2);
elseif y1>y2
    y_ech=round(y1:-abs(y1-y2)/L:y2);
end
end