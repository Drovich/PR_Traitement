function  [xcode,ycode] = extract_code(binary,xech,yech)

a=0;
for i=1:length(binary(1,:));
    if binary(1,i)==1
        xcode(1,1)=xech(1,i);
        ycode(1,1)=yech(1,i);
        a = a+1;
        break;
    end
end

for i=length(binary(1,:)):-1:1;
    if binary(1,i)==1
        xcode(1,2)=xech(1,i);
        ycode(1,2)=yech(1,i);
        a = a+1;
        break;
    end
end

if a<2
    xcode(1,1) = xech(1,1);
    xcode(1,2) = xech(1,2);
    ycode(1,1) = yech(1,1);
    ycode(1,2) = yech(1,2);
end

end