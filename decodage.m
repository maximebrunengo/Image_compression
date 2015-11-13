function [ I_DPCM ] = decodage( I_C, dictionnaire, lignes, colonnes )
    
    I_C_deco = huffmandeco(I_C, dictionnaire);
    I_DPCM = reshape(I_C_deco, lignes, colonnes);
    
end

