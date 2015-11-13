function [ I_DPCM ] = dpcm( I, a, b, c, pas )

    I_DPCM = zeros(size(I,1),size(I,2));
    I_DPCM(1,:) = I(1,:);
    I_DPCM(:,1) = I(:,1);
  
    I_rec = I;
    
    for i=2:size(I,1)
        for j=2:size(I,2)
                % Estimation de x
                x_chapeau = a*I_rec(i,j-1)+b*I_rec(i-1,j-1)+c*I_rec(i-1,j);
                % Calcul de l'erreur estimée
                erreur = I_rec(i,j)-x_chapeau;
                % Quantification
                e_q = round(erreur/pas);
                I_DPCM(i,j) = e_q;
                I_rec(i,j) = e_q*pas+x_chapeau;
        end
    end

end

