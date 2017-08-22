%Im = imread('images/coins.png');
Im = imread('images/buraco21.jpg');


Im = imresize (Im, [NaN 500]);
Im = rgb2gray(Im);
Im = medfilt2(Im, [7 7]);

gaussian1 = imgaussfilt(Im, 15);
gaussian2 = imgaussfilt(Im, 3);
dog = gaussian1 - gaussian2;

subplot(1, 3, 1); imshow(Im);
subplot(1, 3, 2); imshow(gaussian1);
subplot(1, 3, 3); imshow(gaussian2);
figure;
imshow(dog, []);