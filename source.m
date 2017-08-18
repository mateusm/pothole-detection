% Trabalho de final de PDI 

% Felipe Oliveira, Mateus Meruvia, Matheus Garcia 

% Detection and Counting of Pothole using Image Processing Techniques 
%######################################################################

% preparando a imagem
% - leitura
% - redimenciona imagem
% - altera para escala de cinza
% - Median-filtering
img = imread('images/buraco2.jpg');
img = imresize (img, [NaN 500]);
img = rgb2gray(img);
img = medfilt2(img);

% - diffenrece gaussian filter ---TODO

% tem que tentar usar aquele funcao que ta no arquivo DoG.m
% nao sei como usar ela... talvez funcione e faça o que precisamos

imshow(img);



