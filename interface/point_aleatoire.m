function [x y] = point_aleatoire(xlim,ylim)

x=zeros(2,1);
y=zeros(2,1);
if abs(xlim(1)-xlim(2)) > abs(ylim(1)-ylim(2))
    x(1)=xlim(1)-2;
    x(2)=xlim(2)+2;
    y = floor(ylim(1) + (ylim(2)-ylim(1))*rand(2,1) );
else
    y(1)=ylim(1)-2;
    y(2)=ylim(2)+2;
    x = floor(xlim(1) + (xlim(2)-xlim(1))*rand(2,1) )
end

end