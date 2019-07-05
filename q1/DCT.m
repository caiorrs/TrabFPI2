function saidaDCT = DCT(bloco)
% formula de https://pt.wikipedia.org/wiki/Transformada_discreta_de_cosseno#Transformada_bidimensional
    n = 8;
    saidaDCT = zeros(n, n);
    
    for i=0:n
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
                    acumulado = acumulado + bloco(x+1,y+1)... % +1 pois os loops vao de 0 a n-1 (0 a 7)
                                * cos((2*y+1)*j*pi/2*n)...    % mas os indices de matrizes comecam em 1,1
                                * cos((2*x+1)*i*pi/2*n);
                end
            end
            saidaDCT = 1 / sqrt(2*n) * Ci *Cj * acumulado;
        end
    end

end