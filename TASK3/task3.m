% Task 3 form Homework

%1)
abdcross = imread('Abgcross-Original.tif');

abdcross_noise = imread('abgcross_noise.tif');

% First, load a predefined neural network to denoise an image:

net = denoisingNetwork('DnCNN');

% next, use the denoiseImage() function:

B = denoiseImage(abdcross_noise,net);

A = denoiseImage(abdcross, net);


% Then, after denoising the image, we can binarize them
% to get the background and the cross:

A1 = imbinarize(A);
B1 = imbinarize(B);

% remove existing points by dilation and erosion (closing)

se = strel('disk',7);
BC = imclose(B1, se);
BO = imopen(BC,se);




%2) a) Calculate area:


bwarea(A1);
bwarea(BO);

% b)
perim1 = regionprops(A1,"Perimeter")

perim1.Perimeter

perim2 = regionprops(BO,"Perimeter")

perim2.Perimeter



% dice score

similarity = dice(A1,BO)



% save files

imwrite(A1, 'clopen_seg_denoise_abd_cross.tif', 'tif');
imwrite(BO, 'clopen_seg_denoise_abd_cross_noisy.tif', 'tif');


imwrite(A1, 'clopen_seg_denoise_abd_cross.png', 'png');
imwrite(BO, 'clopen_seg_denoise_abd_cross_noisy.png', 'png');
