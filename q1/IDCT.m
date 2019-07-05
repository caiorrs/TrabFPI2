function saidaIDCT = IDCT(entrada)
% formula de https://pt.wikipedia.org/wiki/Transformada_discreta_de_cosseno#Transformada_bidimensional
    
    n = size(entrada,1);
    saidaIDCT = zeros(n, n);
    
    for i=0:n-1
        if i == 0
            Ci = 1 / sqrt(n);
        else
            Ci = sqrt(2/n);
        end
        for j=0:n-1
            acumulado = 0;
            if j == 0
                Cj = 1 / sqrt(n);
            else
                Cj = sqrt(2/n);
            end
            for x=0:n-1
                for y=0:n-1
                    acumulado = acumulado + Ci * Cj * entrada(i,j)... 
                                * cos((2*y+1)*j*pi/2*n)...
                                * cos((2*x+1)*i*pi/2*n);
                end
            end
            saidaIDCT(i,j) = 1 / 4 * acumulado;
        end
    end

end