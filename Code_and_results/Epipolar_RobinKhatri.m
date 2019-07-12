% Lab III - Epipolar Geometry
% If you want to input your points, unquote line [A1, A2] = clickPoints(I1,
% I2, N); and quote line load points.mat

clear all;
close all;

% Step 1. Manually obtain 8 corresponding points between two images (left
% and right) - stereo setup

N = 8; % corresponding points
% Read images
I1 = imread("stereo1.jpg"); % Left view image
I2 = imread("stereo2.jpg"); % Right view image

% Select points

%[A1, A2] = clickPoints(I1, I2, N);
%save('points.mat', 'A1', 'A2') % Save points to a local file - points.mat
load points.mat % Load file with 8 selected points, the variables will be A1 and A2.

% Step 2: Fundamental matrix
% The function matF computes fundamental matrix using 8-point algorithm
F = MatF(A1, A2);
F;

% F is a singular matrix, check its determinant
d = det(F);
d;

% Step 3: Find epipoles
% The function to calculate epipoles is epipoles.M
% e1: epipole for left camera view, e2: epipole for right camera view
[e1, e2] = epipoles(F);
e1;
e2;

% Step 4: Find corresponding epipolar lines in right image for selected
% points in left image
% Function click(I1, I2, F) provides an interactive way to do this.

click(I1, I2, F);