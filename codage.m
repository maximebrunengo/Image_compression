function [I_C,dictionnaire] = codage(I_DPCM)
    
    [counts x] = imhist(I_DPCM);
    p = counts./(size(I_DPCM,1)*size(I_DPCM,2));
    
    [dictionnaire avglen] = huffmandict(x, p);
    disp(avglen);
    I_C = huffmanenco(I_DPCM(:), dictionnaire);

end
