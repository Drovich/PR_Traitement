function [profil] = extract_from_img(x,y,IM)

% profil=IM(y(1,:),x(1,:));
for i=1:length(y)
    profil(1,i)=IM(y(1,i),x(1,i));

end
end