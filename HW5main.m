%%%%% Homework 5 -- EE542
%%%%% by Jiaming Chen
%%%%% 10-06-2017
clear
close all

file_name = input('type the name of the image file to process :','s');
f = imread(file_name);
% f = imread('xbank.jpg');
%%  Building Laplacian of Gaussian kernel
%initialize LoG tests
test.sigma = [];
test.kernel = [];
test.conv = [];
test.edge_map = [];
test.threshold = [];
LoG = repmat(test,3,1);
LoG(1).sigma = 1;LoG(2).sigma = 1.5;LoG(3).sigma = 2;
clear test

for i = 1:3
    
    size_ = 3*LoG(i).sigma;% at least three times the size of central lobe (~standard deviation)
    LoG(i).kernel = zeros(2*size_+1,2*size_+1);
    %building kernel
    for x= -size_:size_
        for y= -size_:size_
            LoG(i).kernel(x+size_+1,y+size_+1) = exp(- (x^2+y^2) /...
                (2*LoG(i).sigma^2)) * (x^2+y^2- (2*LoG(i).sigma^2)) / LoG(i).sigma^4;
        end
    end

end

figure;
subplot(1,3,1);mesh(-LoG(1).kernel);title('LoG Filter Impulse Response (sigma=1.0)');
subplot(1,3,2);mesh(-LoG(2).kernel);title('LoG Filter Impulse Response (sigma=1.5)');
subplot(1,3,3);mesh(-LoG(3).kernel);title('LoG Filter Impulse Response (sigma=2.0)');

%% convolution and edge map
for i = 1:3
    LoG(i).conv = conv2(LoG(i).kernel,double(f));
    LoG(i).edge_map = true(size(LoG(i).conv));%initialize edge map
    % find the positive values location, zero-crossing points are where
    % there're discontinuties among those locations
    [row,col] = find(diff(LoG(i).conv>0)~=0);%diff -> differences in x direction
    for p = 1:length(row)
        LoG(i).edge_map(row(p),col(p)) = false; % flip the points to 0
    end
end

figure;
subplot(2,2,1);imshow(f);title('original image');
subplot(2,2,2);imshow(LoG(1).edge_map);title('LoG Edge Map (sigma=1.0)');
subplot(2,2,3);imshow(LoG(2).edge_map);title('LoG Edge Map (sigma=1.5)');
subplot(2,2,4);imshow(LoG(3).edge_map);title('LoG Edge Map (sigma=2.0)');

%% thresholding test
for T = 60:10:90

for i = 1:3
    
    devs = diff(LoG(i).conv);
    %use the derivatives percentail to as the thresholding value
    LoG(i).threshold = prctile(abs(devs(:)),T);
    
    LoG(i).edge_map = true(size(LoG(i).conv));%initialize edge map
    [row,col] = find(diff(LoG(i).conv>0)~=0 & abs(devs)>LoG(i).threshold);%diff -> differences in x direction
    for p = 1:length(row)
        LoG(i).edge_map(row(p),col(p)) = false; % flip the points to 0
    end
    
end
 

figure;
subplot(2,2,1);imshow(f);title('original image');
subplot(2,2,2);imshow(LoG(1).edge_map);
title(['LoG Edge Map ' '(sigma=' num2str(LoG(1).sigma) ',threshold=' num2str(LoG(1).threshold) ')']);
subplot(2,2,3);imshow(LoG(2).edge_map);
title(['LoG Edge Map ' '(sigma=' num2str(LoG(2).sigma) ',threshold=' num2str(LoG(2).threshold) ')']);
subplot(2,2,4);imshow(LoG(3).edge_map);
title(['LoG Edge Map ' '(sigma=' num2str(LoG(3).sigma) ',threshold=' num2str(LoG(3).threshold) ')']);

end