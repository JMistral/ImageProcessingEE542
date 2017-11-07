%%%%% Homework 3 -- EE542
%%%%% by Jiaming Chen
%%%%% 9-18-2017
clear
close all

file_name = input('type the name of the image file to process :','s');


%% a
f = imread(file_name);
figure(1);
subplot(2,1,1);imshow(f);title('original grayscale image');
subplot(2,1,2);imhist(f);title('corresponding histogram');

%% b
f_inv = uint8(255.*ones(256,256)) - f;
figure(2);
subplot(2,1,1);imshow(f_inv);title('inverse grayscale image');
subplot(2,1,2);imhist(f_inv);title('corresponding histogram');

%% c
factor = 255/(max(f(:))-min(f(:)));
stretched = uint8( (f-min(f(:)))*factor );
figure(3);
subplot(2,1,1);imshow(stretched);title('constrast stretched grayscale image');
subplot(2,1,2);imhist(stretched);title('corresponding histogram');

%% d
pixels = double(f(:));
bincounts = histc(pixels,0:255);
%cumulative probability function
cum = cumsum(bincounts)/numel(f);
%s = T(f), where cum(S) = [1/255 1/255 ... 1/255] and cum(F) = cum
GL_eq = 255*cum; % a one to one function
new_pixels = zeros(size(pixels));
for p = 1:length(pixels)
    new_pixels(p) = round(GL_eq(pixels(p)+1)); % transform and quantization
end
new_img = uint8(reshape(new_pixels,size(f)));
figure(4);
subplot(2,1,1);imshow(new_img);title('histogram equalized grayscale image');
subplot(2,1,2);imhist(new_img);title('corresponding histogram');
    