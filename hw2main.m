%%%%% Homework 2 -- EE542
%%%%% by Jiaming Chen
%%%%% 9-15-2017
clear
close all
%% Q1 interpolation
% Please uncomment the following chunk of code and run this section when
% testing it

% img_orig = [30 42 105 140;68 217 231 87;53 118 106 28;250 239 16 120];
% img_new = zeros(5,5);
% 
% for  x= 1:length(img_new(:,1))
%     for y = 1:length(img_new(1,:))
%         e_pos = [1+(x-1)*0.75, 1+(y-1)*0.75];
%         f_pos = [e_pos(1),floor(e_pos(2))];
%         g_pos = [e_pos(1),ceil(e_pos(2))];
%         a_value = img_orig(floor(g_pos(1)),g_pos(2));
%         b_value = img_orig(ceil(g_pos(1)),g_pos(2));
%         c_value = img_orig(floor(f_pos(1)),f_pos(2));
%         d_value = img_orig(ceil(f_pos(1)),f_pos(2));
%         f_value = c_value+(f_pos(1)-floor(f_pos(1)))*(d_value-c_value);
%         g_value = a_value+(g_pos(1)-floor(g_pos(1)))*(b_value-a_value);
%         e_value = f_value+(e_pos(2)-f_pos(2))*(g_value-f_value);
%         img_new(x,y) = e_value;
%     end
% end
%% Q2 rotation
f = imread('moon.jpg');
img_new = ImgRotate(f,pi/6,'full');
figure(1);
subplot(3,1,1);imshow(img_new);title('rotation angle = 30, mode = full');
img_new = ImgRotate(f,-pi/4);
subplot(3,1,2);imshow(img_new);title('rotation angle = -45, mode = crop');
img_new = ImgRotate(f,pi*110/180,'full');
subplot(3,1,3);imshow(img_new);title('rotation angle = 110, mode = full');
%% Q3 shear
%(0.5, 0), (0, -0.75), and (0.5, -0.75). 
img_new = ImgShear(f,0.5,0);
figure(2);
subplot(3,1,1);imshow(img_new);title('sv=0.5,sh=0');
img_new = ImgShear(f,0,-0.75);
subplot(3,1,2);imshow(img_new);title('sv=0,sh=-0.75');
img_new = ImgShear(f,0.5,-0.75);
subplot(3,1,3);imshow(img_new);title('sv=0.5,sh=-0.75');

