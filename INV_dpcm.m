function [ I_R ] = INV_dpcm( I_DPCM, a, b, c, pas )

    I_R = zeros(size(I_DPCM,1),size(I_DPCM,2));
    
    I_R(1,:) = I_DPCM(1,:);
    I_R(:,1) = I_DPCM(:,1);
    
    for i=2:size(I_DPCM,1)
        for j=2:size(I_DPCM,2)
            I_R(i,j)=I_DPCM(i,j)*pas+a*I_R(i,j-1)+b*I_R(i-1,j-1)+c*I_R(i-1,j);
        end
    end
    

end

