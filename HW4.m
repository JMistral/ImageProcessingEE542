%%%%% Homework 4 -- EE542
%%%%% by Jiaming Chen
%%%%% 9-28-2017
clear
close all

file_name = input('type the name of the image file to process :','s');
f = imread(file_name);
%f = imread('peaks.jpg');

%% Robert Operator
h1_rob = [0 1;-1 0]; h2_rob = [1 0;0 -1];
C1 = conv2(h1_rob,double(f));
C2 = conv2(h2_rob,double(f));
grad_rob = sqrt(C1.^2 + C2.^2);

figure(1);
subplot(2,2,1);imshow(f);title('original grayscale image');

T = 5;binary_edge_rob = grad_rob>=T;
subplot(2,2,2);imshow(binary_edge_rob);title(['Robert Operator edge map with T=' num2str(T)]);

T = 15;binary_edge_rob = grad_rob>=T;
subplot(2,2,3);imshow(binary_edge_rob);title(['Robert Operator edge map with T=' num2str(T)]);

T = 45;binary_edge_rob = grad_rob>=T;
subplot(2,2,4);imshow(binary_edge_rob);title(['Robert Operator edge map with T=' num2str(T)]);

%experiement on new T values
figure(2)
subplot(2,2,1);imshow(f);title('original grayscale image');

T = 20;binary_edge_rob = grad_rob>=T;
subplot(2,2,2);imshow(binary_edge_rob);title(['Robert Operator edge map with T=' num2str(T)]);

T = 25;binary_edge_rob = grad_rob>=T;
subplot(2,2,3);imshow(binary_edge_rob);title(['Robert Operator edge map with T=' num2str(T)]);

T = 30;binary_edge_rob = grad_rob>=T;
subplot(2,2,4);imshow(binary_edge_rob);title(['Robert Operator edge map with T=' num2str(T)]);
%% Sobel Operator
h1_sob = [-1 0 1;-2 0 2;-1 0 1]; h2_sob = [1 2 1;0 0 0;-1 -2 -1];
C1_s = conv2(h1_sob,double(f));
C2_s = conv2(h2_sob,double(f));
grad_sob = sqrt(C1_s.^2 + C2_s.^2);

figure(3);
subplot(2,2,1);imshow(f);title('original grayscale image');

T = 5;binary_edge_sob = grad_sob>=T;
subplot(2,2,2);imshow(binary_edge_sob);title(['Sobel Operator edge map with T=' num2str(T)]);

T = 15;binary_edge_sob = grad_sob>=T;
subplot(2,2,3);imshow(binary_edge_sob);title(['Sobel Operator edge map with T=' num2str(T)]);

T = 45;binary_edge_sob = grad_sob>=T;
subplot(2,2,4);imshow(binary_edge_sob);title(['Sobel Operator edge map with T=' num2str(T)]);

figure(4);
subplot(2,2,1);imshow(f);title('original grayscale image');

T = 60;binary_edge_sob = grad_sob>=T;
subplot(2,2,2);imshow(binary_edge_sob);title(['Sobel Operator edge map with T=' num2str(T)]);

T = 65;binary_edge_sob = grad_sob>=T;
subplot(2,2,3);imshow(binary_edge_sob);title(['Sobel Operator edge map with T=' num2str(T)]);

T = 75;binary_edge_sob = grad_sob>=T;
subplot(2,2,4);imshow(binary_edge_sob);title(['Sobel Operator edge map with T=' num2str(T)]);