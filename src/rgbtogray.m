function  [gray] = rgbtogray(rgb)

gray = (rgb(:,:,1)+rgb(:,:,2)+rgb(:,:,3))/3;

end