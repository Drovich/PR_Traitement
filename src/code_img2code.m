function [binary_code] = code_img2code(binary_code_image,n)

% profil=IM(y(1,:),x(1,:));
for i=1:round(length(binary_code_image)/n)
    binary_code(1,i)=mean(binary_code_image(n*(i-1)+1:n*i));

end