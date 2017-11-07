%%%%% Homework 7 -- EE542
%%%%% by Jiaming Chen
%%%%% 11-02-2017
clear
close all

%%
u = 0;
At = [sqrt(1/6) sqrt(1/3)*[cos(u*pi/4) cos(5*u*pi/12) cos(7*u*pi/12) cos(3*u*pi/4) cos(11*u*pi/12)]];
u = 1;
At = [At;sqrt(1/6) sqrt(1/3)*[cos(u*pi/4) cos(5*u*pi/12) cos(7*u*pi/12) cos(3*u*pi/4) cos(11*u*pi/12)]];
u = 2;
At = [At;sqrt(1/6) sqrt(1/3)*[cos(u*pi/4) cos(5*u*pi/12) cos(7*u*pi/12) cos(3*u*pi/4) cos(11*u*pi/12)]];
u = 3;
At = [At;sqrt(1/6) sqrt(1/3)*[cos(u*pi/4) cos(5*u*pi/12) cos(7*u*pi/12) cos(3*u*pi/4) cos(11*u*pi/12)]];
u = 4;
At = [At;sqrt(1/6) sqrt(1/3)*[cos(u*pi/4) cos(5*u*pi/12) cos(7*u*pi/12) cos(3*u*pi/4) cos(11*u*pi/12)]];
u = 5;
At = [At;sqrt(1/6) sqrt(1/3)*[cos(u*pi/4) cos(5*u*pi/12) cos(7*u*pi/12) cos(3*u*pi/4) cos(11*u*pi/12)]];

tc = At*[5 -3 4 4 -3 5]';

s = [sqrt(1/2);1;1];
h = [1;exp(-i*pi/6);exp(-i*pi/3)];
real(s.*h.*tc(1:3))
