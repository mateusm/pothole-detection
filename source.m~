% Trabalho de final de PDI 

% Felipe Oliveira, Mateus Meruvia, Matheus Garcia 

% Detection and Counting of Pothole using Image Processing Techniques 
%-----------------------------------------------------------------------------------------------

%lê imagem
original = imread('images/buraco9.jpg');
img = original;


% IMAGE PRE-PROCESSING
%#############################################
% - redimenciona imagem
% - altera para escala de cinza
% - Median-filtering
img = imresize (img, [NaN 500]);
img = rgb2gray(img);
img = medfilt2(img, [7 7]);

% - difference gaussian filter ---- ACHO QUE ESSE FILTRO TA CAGANDO TUDO!!!
% TEM QUE ARRUMAR ELE, TALVEZ OS PARAMETROS.. NAO SEI...
% https://github.com/memimo/Timothee/blob/master/matlab/DoG.m
filtDoG = DoG(9,5,10);
img = imfilter(img, filtDoG);
%############################################# END - IMAGE PRE-PROCESSING




% IMAGE SEGMENTATION METHODS
%############################################

% #METHODS

% #1 - Canny Edge Dection Technique
% https://www.mathworks.com/matlabcentral/fileexchange/45459-canny-edge-detection-in-2-d-and-3-d
%-------------------------------------------
img_double = im2double(img); %a funcao canny precisa de double
img_canny = canny(img_double,30); % segundo argumento é a OPCIONAL. Serve pra tratar a imagem com um gaussiano.
subplot(2,2,1), imshow(img_canny); title('CANNY');
%-------------------------------------------



% #2 - Thresholding technique based on Otsu?s method
% funcao nativa MATLAB (https://www.mathworks.com/help/images/ref/graythresh.html)
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

%################################################## END - IMAGE SEGMENTATION METHODS



% POTHOLE IDENTIFICATION AND COUNTING
%###################################################

% #METHODS

% #1 - Black and white-Convexhull 
% funcao nativa MATLAB (https://www.mathworks.com/help/images/ref/bwconvhull.html)
%---------------------------------------------
otsu_convexhull =  bwconvhull(img_otsu, 'objects');
figure;
subplot(2,2,1), imshow(otsu_convexhull); title('CONVEX HULL');
%---------------------------------------------


% #2 - Number of Black and white-connected components
% funcao nativa MATLAB (https://www.mathworks.com/help/images/ref/bwconncomp.html)
%----------------------------------------------
otsu_bwcomp = img_otsu;
CC =  bwconncomp(img_otsu);
numPixels = cellfun(@numel,CC.PixelIdxList);
[biggest,idx] = max(numPixels);
otsu_bwcomp(CC.PixelIdxList{idx}) = 0;
subplot(2,2,2), imshow(otsu_bwcomp); title('BW Components');
%-----------------------------------------------


% #3 - Red-mask pothole detection - TODO
%------------------------------------------------
%your code here--

%------------------------------------------------

%############################################## END - POTHOLE IDENTIFICATION AND COUNTING








% PERFORMANCE MEASURES FOR VALIDATION OF IMAGE SEGMENTATION
%############################################################



figure;
subplot(2,1,1), imshow(original); title('Original');
subplot(2,1,2), imshow(img); title('Preparada');

