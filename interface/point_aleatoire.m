function [x y] = point_aleatoire(xlim,ylim, w, h)

x=zeros(2,1);
y=zeros(2,1);
if abs(xlim(1)-xlim(2)) > abs(ylim(1)-ylim(2))
    x(1)=max(xlim(1)-2, 1);
    x(2)=min(xlim(2)+2, w);
    y = floor(ylim(1) + (ylim(2)-ylim(1))*rand(2,1) );
else
    y(1)=max(ylim(1)-2, 1);
    y(2)=min(ylim(2)+2, h);
    x = floor(xlim(1) + (xlim(2)-xlim(1))*rand(2,1) );
end

end