function quantizacao(in_image, matriz_DCT) = [out_image]

    figure, imshow(in_image), title('Imagem original');

    matriz_quant = [ 16 11 10 16 24 40 51 61; ...
                     12 12 14 19 26 58 60 55; ...
                     14 13 16 24 40 57 69 56; ...
                     14 17 22 29 51 87 80 62; ...
                     18 22 37 56 68 109 103 77; ...
                     24 35 55 64 81 104 113 92;
                     49 64 78 87 103 121 120 101; ...
                     72 92 95 98 112 100 103 99;
                    ];
	[larg, alt] = size(image);
    
    % a imagem deve ter dimensoes multiplas de 8
    % pois a matriz de quantização é 8x8
    
    if mod(larg,8) ~= 0
        larg = larg + mod(larg,8);
    end
    
    if mod(alt,8) ~= 0
        alt = alt + mod(alt,8);
    
    end
    
    imagem_quantizada = zeros(larg, alt);
    
    for i = 1:alt
        for j = 1:larg
            imagem_quantizada[i, j] = round(matriz_DCT / matriz_quant[i, j])
            % precisa dividir a imagem (o loop) em blocos 8x8
        end
    end
end