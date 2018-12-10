function [x_ech,y_ech,L] = echantillonage(a1,a2,L)


x1 = (a1(1));
y1 = (a2(1));

x2 = (a1(2));
y2 = (a2(2));
if x1==x2
    x2=x1-1;
end
if y1==y2
    y2=y1-1;
end

if L==0
    L = sqrt((x1-x2)^2+(y1-y2)^2);
end

if x1<x2
    x_ech=floor(x1:abs(x1-x2)/L:x2);
elseif x1>x2
    x_ech=floor(x1:-abs(x1-x2)/L:x2);
% else
%     if y1<y2
%     y_ech=floor(y1:abs(y1-y2)/L:y2);
% elseif y1>y2
%     y_ech=floor(y1:-abs(y1-y2)/L:y2);
%     end
%     for i=1:length(y_ech(1,:))
%         x_ech(1,i) = x1;
%     end
    
end

if y1<y2
    y_ech=round(y1:abs(y1-y2)/L:y2);
elseif y1>y2
    y_ech=round(y1:-abs(y1-y2)/L:y2);
% else
%     if x1<x2
%     x_ech=round(x1:abs(x1-x2)/L:x2);
% elseif x1>x2
%     x_ech=round(x1:-abs(x1-x2)/L:x2);
%     end
%     for i=1:length(x_ech(1,:))
%         y_ech(1,i) = y2;
%     end
    
end


end