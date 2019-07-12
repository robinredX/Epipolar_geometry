% Lab III - Epipolar Geometry

clear all;
close all;

% We'll use betterPointsX1X2.mat. For manual selection of points see - Epipolar_RobinKhatri.mat

N = 8; % corresponding points
% Read images
I1 = imread("stereo1.jpg"); % Left view image
I2 = imread("stereo2.jpg"); % Right view image

% Load points from betterPointsX1X2.mat
load betterPointsX1X2.mat

% Fundamental matrix
F = MatF(X1, X2);
F;

% Epipoles
[e1, e2] = epipoles(F);
e1;
e2;

% Step 4: Find corresponding epipolar lines in right image for selected
% points in left image
% Function click(I1, I2, F) provides an interactive way to do this.

click(I1, I2, F);