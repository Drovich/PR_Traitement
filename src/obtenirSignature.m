function [ensembleSignature] = obtenirSignature(n)

B = ones(1,n);
N = zeros(1,n);
ensembleSignature = ones(30, n*7);

ensembleSignature(1, :) = [ B B B N N B N];
ensembleSignature(2, :) = [ B B N N B B N];
ensembleSignature(3, :) = [ B B N B B N N];
ensembleSignature(4, :) = [ B N N N N B N];
ensembleSignature(5, :) = [ B N B B B N N];
ensembleSignature(6, :) = [ B N N B B B N];
ensembleSignature(7, :) = [ B N B N N N N];
ensembleSignature(8, :) = [ B N N N B N N];
ensembleSignature(9, :) = [ B N N B N N N];
ensembleSignature(10, :) = [ B B B N B N N];

ensembleSignature(11, :) = [ B N B B N N N];
ensembleSignature(12, :) = [ B N N B B N N];
ensembleSignature(13, :) = [ B B N N B N N];
ensembleSignature(14, :) = [ B N B B B B N];
ensembleSignature(15, :) = [ B B N N N B N];
ensembleSignature(16, :) = [ B N N N B B N];
ensembleSignature(17, :) = [ B B B B N B N];
ensembleSignature(18, :) = [ B B N B B B N];
ensembleSignature(19, :) = [ B B B N B B N];
ensembleSignature(20, :) = [ B B N B N N N];

ensembleSignature(21, :) = [ N N N B B N B];
ensembleSignature(22, :) = [ N N B B N N B];
ensembleSignature(23, :) = [ N N B N N B B];
ensembleSignature(24, :) = [ N B B B B N B];
ensembleSignature(25, :) = [ N B N N N B B];
ensembleSignature(26, :) = [ N B B N N N B];
ensembleSignature(27, :) = [ N B N B B B B];
ensembleSignature(28, :) = [ N B B B N B B];
ensembleSignature(29, :) = [ N B B N B B B];
ensembleSignature(30, :) = [ N N N B N B B];

end