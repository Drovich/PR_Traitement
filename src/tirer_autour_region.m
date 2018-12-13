function [x,y] = tirer_autour_region(I);

[h w] = size(I)
k=1;
for i=1:h
    for j=1:w
        if I(i,j)>0
            X(k)=j;
            Y(k)=i;
            k=k+1;
        end
    end
end

xmax=max(X);
xmin=min(X);
ymax=max(Y);
ymin=min(Y);
x=[xmin xmax];
y=[ymin ymax];
end


