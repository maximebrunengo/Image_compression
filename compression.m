%RAFFARA & BRUNENGO

close all;
clear all;
clc;

I = imread('../Image/lena.gif');
I_double = double(I./8);
I_int = int8(I_double);

a = 1;
b = -1;
c = 1;

% Choix du pas pour la compression
pas = 1.5;

% DPCM de l'image
I_DPCM_double = dpcm(I_double, a, b, c, pas);
I_DPCM = int8(I_DPCM_double);

% Affichage de l'entropie de l'image après DPCM
disp(entropy(I_DPCM_double));
         
% Codage de Huffman
[I_C, dict] = codage(I_DPCM);

% Décodage 
I_DPCM_decodage = decodage(I_C, dict, size(I,1), size(I,2));

% Reconstruction de l'image : inversion de DPCM
I_reco = int8(INV_dpcm(I_DPCM_decodage, a, b, c, pas));

% Difference entre image d'origine et image compressée
I_diff = int8(I_double) - I_reco;

% Affichage du PSNR entre l'image de base et l'image compressée
disp(psnr(uint8(I_reco), uint8(I_int)));

% Affichage de l'image d'origine et de l'image reconstruite 
figure(), subplot(1,2,1), imshow(uint8(I_int*8)),
            title('Image d origine'),
          subplot(1,2,2), imshow(uint8(I_reco*8)),
            title(['Reconstruction avec un pas = ',num2str(pas)]);



          