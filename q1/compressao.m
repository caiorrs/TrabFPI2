   image = imread('cameraman.tif');
   figure, imshow(image), title('Imagem original');

   matriz_quant = [ 16 11 10 16 24 40 51 61; ...
                     12 12 14 19 26 58 60 55; ...
                     14 13 16 24 40 57 69 56; ...
                     14 17 22 29 51 87 80 62; ...
                     18 22 37 56 68 109 103 77; ...
                     24 35 55 64 81 104 113 92;
                     49 64 78 87 103 121 120 101; ...
                     72 92 95 98 112 100 103 99;
                    ];
    
 
    quality = 90; % Valores aceitados: 0 > quality < 98
        
    if quality > 50
        matriz_quant = round(matriz_quant.*(ones(8)*((100-quality)/50)));
    elseif quality < 50
        matriz_quant = round(matriz_quant.*(ones(8)*(50/quality)));
    end
    
	[alt, larg] = size(image);
    alt_original = alt;
    larg_original = larg;
    % a imagem deve ter dimensoes multiplas de 8
    % pois a matriz de quantização é 8x8
    
    in_image = image;
    if (mod(larg,8) ~= 0)
        in_image = [in_image zeros(alt,8-mod(larg,8))];
        larg = larg + 8-mod(larg,8);
        
    end
    
    if (mod(alt,8) ~= 0)
        in_image = [in_image;zeros(8-mod(alt,8),larg)];
        alt = alt + 8-mod(alt,8);
    end
    
    %vetores de blocos
    num_blocos_alt = alt/8;
    num_blocos_larg = larg/8;
    num_blocos = num_blocos_alt * num_blocos_larg;
    blocos = cell(num_blocos);
    blocos_DCT = cell(num_blocos);
    blocos_quant = cell(num_blocos);
    blocos_requant = cell(num_blocos);
    blocos_decod = cell(num_blocos);
    
    %divisão da imagem em blocos
    n=1;
    for i = 0:8:alt-8
        for j = 0:8:larg-8
            if(i==0 && j==0)
                blocos{n} = in_image(1:8,1:8);
                n = n+1;
            elseif(i==0)
                blocos{n} = in_image(1:8,j:j+7);
                n = n+1;
            elseif(j==0)
                blocos{n} =in_image(i:i+7,1:8);
                n = n+1;
            else 
                blocos{n} = in_image(i:i+7,j:j+7);
                n = n+1;
            end
            
        end
    end
   
    %aplicação da dct nos blocos
    for n=1:num_blocos
        b = int16(blocos{n})-128;
        b_DCT = dct2(double(b));
        blocos_DCT{n} = b_DCT;
    end

    %quantização dos blocos
    for n=1:num_blocos
        for i=1:8
            for j=1:8
                b_DCT = blocos_DCT{n};
                b_q(i,j) = round(b_DCT(i,j)/matriz_quant(i,j));
            end
        end
        blocos_quant{n} = b_q;
    end
    
    %decodificação
    
    %requantização dos blocos
    for n=1:num_blocos
        b_requant = blocos_quant{n}.*double(matriz_quant);
        blocos_requant{n} = b_requant;
    end
    
    %aplicação da dct inversa
    for n=1:num_blocos
        b_decod = idct2(double(blocos_requant{n}));
        blocos_decod{n} = uint8(round(b_decod)+128);
    end
    
    %montando a imagem final
    n=1;
    for i=1:num_blocos_alt
        p_quant = blocos_decod{n};
        for j = 2:num_blocos_larg
            p_quant = [p_quant blocos_decod{n+1}];
            n=n+1;
        end
        n=n+1;
        if(i==1)
            imagem_quantizada=p_quant;
        else
            imagem_quantizada=[imagem_quantizada;p_quant];
        end
    end
    
    out_image = uint8(imagem_quantizada(1:alt_original,1:larg_original));
    figure,imshow(out_image), title(['Imagem resultado, qualidade = ' num2str(quality)]);
    
    % salva as imagens
    filename = sprintf('original.png');
    imwrite(image, filename);
    filename = sprintf('cameraman resultado qualidade-%i.jpg', quality);
    imwrite(out_image, filename);