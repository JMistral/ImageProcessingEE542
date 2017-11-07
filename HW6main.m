%%%%% Homework 5 -- EE542
%%%%% by Jiaming Chen
%%%%% 10-22-2017
clear
close all

%% 1 Moving Average

% kernel size 5
[H1a,amplitude1a] = moving_avg(linspace(-pi,pi,200),linspace(-pi,pi,200),5);
figure;mesh(amplitude1a);title('Plot H1a(u,v)')
figure;plot(linspace(-pi,pi,200),amplitude1a(:,100));
title('Plot H1a(u,0)')

%kernel 15
[H1b,amplitude1b] = moving_avg(linspace(-pi,pi,200),linspace(-pi,pi,200),15);
figure;mesh(amplitude1b);title('Plot H1b(u,v)')
figure;plot(linspace(-pi,pi,200),amplitude1b(:,100));
title('Plot H1b(u,0)')

% 4/pi
H1 = zeros(200,1);
H2 = zeros(200,1);
for u = 1:200
    H1(u) = amplitude1a(u,u);
    H2(u) = amplitude1b(u,u);
end

figure;plot(linspace(-pi,pi,200),H1);
hold on;
plot(linspace(-pi,pi,200),H2);
hold off;
title('Plot H1b(u,u) and H1a(u,u)')
%% 2 Butterworth

% kernel size 5
[H2a,H2a_inv] = butterworth(pi/2,1,5);
H2a_inv
figure;mesh(H2a);title('H2a')
figure;plot(H2a(:,1));title('H2a')

%kernel size 15
[H2b,H2b_inv] = butterworth(pi/2,1,15);
H2b_inv
figure;mesh(H2b);title('H2b')
figure;plot(H2b(:,1));title('H2b')

% kernel size 5 second order
[H2c,H2c_inv] = butterworth(pi/2,2,5);
H2c_inv
figure;mesh(H2c);title('H2c')
figure;plot(H2c(:,1));title('H2c')

% kernel size 15 second order
[H2d,H2d_inv] = butterworth(pi/2,2,15);
H2d_inv
figure;mesh(H2d);title('H2d')
figure;plot(H2d(:,1));title('H2d')

% testing H2d_inv on real image
f = imread('xbank.jpg');
filtered = conv2(H2d_inv,double(f));
figure;
subplot(2,1,1);imshow(f);title('original image');
subplot(2,1,2);imshow(uint8(filtered));title('filtered image with BLPF n=2 15*15 kernel');




