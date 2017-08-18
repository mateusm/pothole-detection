% Trabalho de final de PDI 

% Felipe Oliveira, Mateus Meruvia, Matheus Garcia 

% Detection and Counting of Pothole using Image Processing Techniques 
%-----------------------------------------------------------------------------------------------

%l� imagem
original = imread('images/buraco3.jpg');
original = imresize (original, [NaN 500]); %redimenciona original para melhor visualizacao

img = original;

% IMAGE PRE-PROCESSING
%#############################################
% - redimenciona imagem
% - altera para escala de cinza
% - Median-filtering
img = imresize (img, [NaN 500]);
img = rgb2gray(img);
img = medfilt2(img);

% - difference gaussian filter
% https://github.com/memimo/Timothee/blob/master/matlab/DoG.m
filtDoG = DoG(9,5,10);
img = imfilter(img, filtDoG);
%#############################################




% IMAGE SEGMENTATION METHODS
%############################################

% #1 - Canny Edge Dection Technique
% https://www.mathworks.com/matlabcentral/fileexchange/45459-canny-edge-detection-in-2-d-and-3-d
%-------------------------------------------
img_canny = im2double(img); %a funcao canny precisa de double
img_canny = canny(img_canny,3); % segundo argumento � a OPCIONAL. Serve pra tratar a imagem com um gaussiano.
subplot(2,2,1), imshow(img_canny); title('CANNY');
%-------------------------------------------



% #2 - Thresholding technique based on Otsu?s method
%-------------------------------------------
level_otsu = graythresh(img);
img_otsu = im2bw(img,level_otsu); % for versions from 2016 use imbinarize(img, level) instead
subplot(2,2,2), imshow(img_otsu); title('OTSU');
%--------------------------------------------



% #3 - K-Means Based Image Clustering Technique
% https://www.mathworks.com/matlabcentral/fileexchange/8379-kmeans-image-segmentation
%---------------------------------------------
[vector, mask] = kmeans(img, 2);
subplot(2,2,3), imshow(mask,[]); title('KMEANS');
%---------------------------------------------



% #4 -  Fuzzy C-Means based Image clustering technique
% https://www.mathworks.com/matlabcentral/fileexchange/8351-fuzzy-c-means-thresholding
%---------------------------------------------
img2 = im2double(img);
[img_cmeans, level_cmeans] = fcmthresh(img2,0);
subplot(2,2,4), imshow(img_cmeans); title('CMEANS');
%---------------------------------------------

%################################################## - IMAGE SEGMENTATION METHODS

figure;
imshow(original);
