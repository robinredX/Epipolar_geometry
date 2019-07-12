function F=MatF(p1,p2)
% p1,p2 : vectors of coordinates ...x...

% initialisation
A = [];
N=8;

% Write a martix of homogeneous linear system Af=0

p2(3,:) = ones(1,8);
p1(3,:) = ones(1,8);
transp2 = p2.';
temp = zeros(0,9);
for i = 1:8
temp = p1(:,i).*transp2(i,:);
A(i,:) = temp(:);
end  

% Solving the linear system for the estimate of F by SVD
% Ist step: Linear solution
[U,S,V] = svd(A);
Fest = reshape(V(:,end),3,3);

% 2nd step: Constraint enforcement
Fest=Fest';
[U,S,V] = svd(Fest);
F = U*diag([S(1,1) S(2,2) 0])*V';
disp(F);